package org.south.netty;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.sound.midi.Soundbank;

import com.mysql.jdbc.PreparedStatement;
import org.south.itms.dao.impl.PtableDao;
import org.south.itms.entity.Items;
import org.springframework.beans.factory.annotation.Autowired;

import static java.lang.System.currentTimeMillis;

/**
 * @author jan
 * @date 2017年11月29日 下午4:46:28
 * @version V1.0
 */
public class TableAutoGenerate {

	@Autowired
	private PtableDao ptableDao;

	public static String driver;

	public static String url;

	public static String user;

	public static String password;

	public static ArrayList<String> playTableAutoIdList = new ArrayList<String>();

	public TableAutoGenerate() {
		try {
			// 获得当前类的绝对路径
			// replaceAll("%20", "")这个替换是因为据说getPath()读取时会把空格读取为“%20”
			String webPath = this.getClass().getResource("/").getPath().replaceAll("%20", " ");
			// 截取字符串得到WEB-INF路径然后拼接
			String path = webPath + "config.properties";

			Properties properties = new Properties();
			properties.load(new FileInputStream(path));
			// 获得属性文件中的username,password,driver,url
			user = properties.getProperty("jdbc.username");
			url = properties.getProperty("jdbc.url");
			password = properties.getProperty("jdbc.password");
			driver = properties.getProperty("jdbc.driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 生成同时段多播表
	public int PlayTableGenerate(List<AutoPlayTable> listTable, String uid, int length) throws ParseException {
		// deleteNewPlayTable(listTable.get(0).getPeriodId());
		int ptableid = 0;
		for (AutoPlayTable apt : listTable) {
			if (apt.getListAd().size() > 1) {
				writeSqlTable(apt.getTerminalId(), apt.getPeriodId(), apt.getListAd(), uid, length);
				int pid = getReadSqlTable(apt.getTerminalId(), apt.getPeriodId());
				ptableid = pid;
				Ad[] adArray = new Ad[apt.getListAd().size()];
				int len = 0;

				for (Ad a : apt.getListAd()) {
					adArray[len] = a;
					len++;
				}

				System.out.println("生成播表！！！广告视频在没处理之前是这样的：");
				for(int i = 0; i < adArray.length; i++){
					System.out.print(adArray[i].getFileId() + " ");
				}
				System.out.println();

				Ad[] d = Playlist.generatePlaylist(adArray);

				System.out.println(d.length);
				for(int i = 0; i < d.length; i++){
					System.out.print(d[i].getFileId() + " ");
				 }
				 System.out.println();

				writeSqlPlayFile(pid, d);
			} else if (apt.getListAd().size() == 1) {
				writeSqlTable(apt.getTerminalId(), apt.getPeriodId(), apt.getListAd(), uid, length);
				int pid = getReadSqlTable(apt.getTerminalId(), apt.getPeriodId());
				ptableid = pid;
				Ad[] d = new Ad[1];
				d[0] = apt.getListAd().get(0);
				writeSqlPlayFile(pid, d);
			} else {

			}

			//modify by bobo 2019/11/4
			//把pid给传出来，放在一个静态变量里
			playTableAutoIdList.add(String.valueOf(ptableid));
		}
		return ptableid;
	}



	/**
	 * 生成同时段多播表, 轮播播表的数据库操作方法
	 * @param terminalId
	 * @param periodId
	 * @param ad
	 * @param uid
	 * @param len
	 * @throws ParseException
	 * @date 2019年1月18日 11点18分
	 * @author PC-FAN
	 */
	public static void writeSqlTable(int terminalId, int periodId, List<Ad> ad, String uid, int len)
			throws ParseException {
		Date date = new Date();
		Timestamp timestamp = new Timestamp(date.getTime());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Calendar cal = java.util.Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, len);
		Date nextDate = cal.getTime();
		java.sql.Date sqlDate = new java.sql.Date(nextDate.getTime());
		int sum = 0;
		List<Integer> freqencyList = new ArrayList<Integer>();
		for (Ad a : ad) {
			int d = a.getDuration();
			int f = a.getFreq();
			freqencyList.add(f);
			System.out.println(a.getDuration() + "=" + a.getFreq());
			sum = sum + d * f;
		}
		int min = (int) sum / 60;
		String playtime = sum / 60 + "分" + (sum - min * 60) + "秒";
		int screenTime = getScreenTime(periodId);
		if (screenTime <= 0)
			screenTime = 24 * 60 * 60 * 1000;
		DecimalFormat df = new DecimalFormat("#0.00");
		DecimalFormat df2 = new DecimalFormat("0.00%");
		int tosum = sum * 1000;
		double rate = (float) tosum / (float) screenTime;
		// System.out.println(playtime + "=" + screenTime + "=" + rate);
		String screenRate = df2.format(rate);
		screenTime = screenTime / 1000;
		int allTimeMin = (int) screenTime / 60;
		String allTime = screenTime / 60 + "分" + (screenTime - allTimeMin * 60) + "秒";
		String ptableName = getNameById(terminalId, periodId);
		ptableName = ptableName + "(" + format.format(nextDate) + ")";
		
		Integer baseFrequency = Playlist.arrGcd(freqencyList);
		try {
			// 加载驱动程序
			Class.forName(driver);
			// 连续数据库
			Connection conn = DriverManager.getConnection(url, user, password);
			if (!conn.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			// statement用来执行SQL语句
			String insertSql = "INSERT INTO play_table"
					+ "(user_id, period_id, terminal_id, status_id, play_date, screen_rate, play_totaltime, all_time, ptable_name, create_time, deleted, insert_flag, min, state, base_frequency)"
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement statement = (PreparedStatement) conn.prepareStatement(insertSql);
			String sql = "INSERT INTO play_table (user_id, period_id, terminal_id, status_id, create_time, deleted)"
					+ " VALUES (" + 1 + ", " + periodId + ", " + terminalId + ", " + 1 + ", " + timestamp + ", " + 0
					+ ")";

			System.out.println(sql);
			statement.setInt(1, Integer.parseInt(uid));
			statement.setInt(2, periodId);
			statement.setInt(3, terminalId);
			statement.setInt(4, 1);
			statement.setDate(5, sqlDate);
			statement.setString(6, screenRate);
			statement.setString(7, playtime);
			statement.setString(8, allTime);
			statement.setString(9, ptableName);
			statement.setTimestamp(10, new Timestamp(currentTimeMillis()));
			statement.setInt(11, 0);
			statement.setInt(12, 0);
			statement.setInt(13, 0);
			statement.setInt(14, 0);
			statement.setInt(15, baseFrequency);
			int count = statement.executeUpdate();
			System.out.println(count);
			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 逻辑删除旧播表
	public void deleteNewPlayTable(int periodId, int start, int end) {
		try {
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, user, password);
			if (!conn.isClosed()) {
				System.out.println("Succeeded connecting to the Database!");
				// java.util.Calendar cal=java.util.Calendar.getInstance();
				// cal.setTime(new Date());
				// cal.add(Calendar.DATE,1);
				// Date nextDate=cal.getTime();
				// java.sql.Date sqlDate = new java.sql.Date(nextDate.getTime());
				// String sql = "select pid from play_table where date_format(play_date,
				// '%Y-%m-%d')='" + sqlDate + "' and deleted = 0";
				for (int i = start; i <= end; i++) {
					java.util.Calendar cal = java.util.Calendar.getInstance();
					cal.setTime(new Date());
					cal.add(Calendar.DATE, i);
					Date nextDate = cal.getTime();
					java.sql.Date sqlDate = new java.sql.Date(nextDate.getTime());
					String sql = "select pid from play_table where period_id = " + periodId
							+ " and date_format(play_date, '%Y-%m-%d')='" + sqlDate + "' and deleted = 0";
					Statement statement = conn.createStatement();
					ResultSet rs = statement.executeQuery(sql);
					List<String> list = new ArrayList<String>();
					if (rs.next()) {// 判空
						list.add(rs.getString(1));
						while (rs.next()) {
							list.add(rs.getString(1));
						}
						System.out.println(list.get(0));
						System.out.println(list + "  " + list.size());
						if (list.size() != 0) {
							for (String id : list) {
								// String delSql = "delete from ptable_file where deleted = 0 and pid = ?";
								// PreparedStatement pst = (PreparedStatement) conn.prepareStatement(delSql);
								// pst.setInt(1, Integer.parseInt(id));
								// pst.executeUpdate();
								PreparedStatement stmt = (PreparedStatement) conn
										.prepareStatement("update ptable_file set deleted = 1 where pid = ?");
								stmt.setInt(1, Integer.parseInt(id));
								stmt.executeUpdate();
							}
						}
						String delSqlp = "update play_table set deleted = 1 where period_id = ?";
						PreparedStatement pst1 = (PreparedStatement) conn.prepareStatement(delSqlp);
						pst1.setInt(1, periodId);
						pst1.executeUpdate();
					} else {// 为空不操作
						System.out.println("kong");
					}
				}
				conn.close();
			}
			// String sql = "select pid from play_table where period_id = " + periodId + "
			// and deleted = 0";
			// System.out.println(sql);
			// Statement statement = conn.createStatement();
			// ResultSet rs = statement.executeQuery(sql);
			// List<String> list = new ArrayList<String>();
			// if(rs.next()) {//判空
			// list.add(rs.getString(1));
			// while (rs.next()) {
			// list.add(rs.getString(1));
			// }
			// System.out.println(list.get(0));
			// System.out.println(list + " " + list.size());
			// if(list.size() != 0) {
			// for(String id : list) {
			//// String delSql = "delete from ptable_file where deleted = 0 and pid = ?";
			//// PreparedStatement pst = (PreparedStatement) conn.prepareStatement(delSql);
			//// pst.setInt(1, Integer.parseInt(id));
			//// pst.executeUpdate();
			// PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(
			// "update ptable_file set deleted = 1 where pid = ?");
			// stmt.setInt(1, Integer.parseInt(id));
			// stmt.executeUpdate();
			// }
			// }
			// String delSqlp = "update play_table set deleted = 1 where period_id = ?";
			// PreparedStatement pst1 = (PreparedStatement) conn.prepareStatement(delSqlp);
			// pst1.setInt(1, periodId);
			// pst1.executeUpdate();
			// }else {//为空不操作
			// System.out.println("kong");
			// }
			// }
		} catch (ClassNotFoundException e) {
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 逻辑删除旧播表
	/**
	 * 逻辑删除旧播表，跳过已经审核通过播表
	 * 2018年12月17日 16点57分
	 * @param periodId
	 * @param start
	 * @param end
	 */
	public ArrayList<String> deleteNewPlayTb(int periodId, int start, int end) {
		ArrayList<String> ignorePids = new ArrayList<String>();
		try {
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, user, password);
			if (!conn.isClosed()) {
				System.out.println("Succeeded connecting to the Database Deleted!");
				for (int i = start; i <= end; i++) {
					java.util.Calendar cal = java.util.Calendar.getInstance();
					cal.setTime(new Date());
					cal.add(Calendar.DATE, i);
					Date nextDate = cal.getTime();
					java.sql.Date sqlDate = new java.sql.Date(nextDate.getTime());
					System.out.println(sqlDate);
					String sql = "select pid,status_id from play_table where period_id = " + periodId
							+ " and date_format(play_date, '%Y-%m-%d')='" + sqlDate + "' and deleted = 0";
					Statement statement = conn.createStatement();
					ResultSet rs = statement.executeQuery(sql);
					while (rs.next()) {// 判空
						String id = rs.getString(1);
						String statusId = rs.getString(2);
						System.out.println("deleteNewPlayTb -> pid=" + id + ",statusId=" + statusId);
						//如果已经审核，跳过该播表
						if ("2".equals(statusId) || "3".equals(statusId)) {
							ignorePids.add(id);
						} else {
							PreparedStatement stmt = (PreparedStatement) conn
									.prepareStatement("update ptable_file set deleted = 1 where pid = ?");
							stmt.setInt(1, Integer.parseInt(id));
							stmt.executeUpdate();

							String delSqlp = "update play_table set deleted = 1 where pid = ?";
							PreparedStatement pst1 = (PreparedStatement) conn.prepareStatement(delSqlp);
							pst1.setInt(1, Integer.parseInt(id));
							pst1.executeUpdate();
							System.out.println("deleteNewPlayTb -> 生成新播表前，删除播表pid=" + id + ",statusId=" + statusId);
						}
						
					}
				}
			}
		} catch (ClassNotFoundException e) {
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ignorePids;
	}

	// 生成一个播表
	public void PlayTableGenerate(List<AutoPlayTable> listTable, String uid) throws ParseException {
		// deleteOldPlayTable();
		for (AutoPlayTable apt : listTable) {
			if (apt.getListAd().size() > 1) {
				writeSqlTable(apt.getTerminalId(), apt.getPeriodId(), apt.getListAd(), uid);
				int pid = getReadSqlTable(apt.getTerminalId(), apt.getPeriodId());
				Ad[] adArray = new Ad[apt.getListAd().size()];
				int len = 0;
				for (Ad a : apt.getListAd()) {
					adArray[len] = a;
					len++;
				}
				Ad[] d = Playlist.generatePlaylist(adArray);
				// System.out.println(d.length);
				// for(int i = 0; i < d.length; i++){
				// System.out.print(d[i].getFileId() + " ");
				// }
				// System.out.println();
				writeSqlPlayFile(pid, d);
			} else if (apt.getListAd().size() == 1) {
				writeSqlTable(apt.getTerminalId(), apt.getPeriodId(), apt.getListAd(), uid);
				int pid = getReadSqlTable(apt.getTerminalId(), apt.getPeriodId());
				Ad[] d = new Ad[1];
				d[0] = apt.getListAd().get(0);
				writeSqlPlayFile(pid, d);
			} else {

			}
		}
	}

	// 生成多个播表
	public void PlayTableGenerate(List<AutoPlayTable> listTable) throws ParseException {
		// deleteOldPlayTable();
		for (AutoPlayTable apt : listTable) {
			if (apt.getListAd().size() > 1) {
				writeSqlTable(apt.getTerminalId(), apt.getPeriodId(), apt.getListAd());
				int pid = getReadSqlTable(apt.getTerminalId(), apt.getPeriodId());
				Ad[] adArray = new Ad[apt.getListAd().size()];
				int len = 0;
				for (Ad a : apt.getListAd()) {
					adArray[len] = a;
					len++;
				}
				Ad[] d = Playlist.generatePlaylist(adArray);
				// System.out.println(d.length);
				// for(int i = 0; i < d.length; i++){
				// System.out.print(d[i].getFileId() + " ");
				// }
				// System.out.println();
				writeSqlPlayFile(pid, d);
			} else if (apt.getListAd().size() == 1) {
				writeSqlTable(apt.getTerminalId(), apt.getPeriodId(), apt.getListAd());
				int pid = getReadSqlTable(apt.getTerminalId(), apt.getPeriodId());
				Ad[] d = new Ad[1];
				d[0] = apt.getListAd().get(0);
				writeSqlPlayFile(pid, d);
			} else {

			}
		}
	}

	public void deleteOldPlayTable() {
		try {
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, user, password);
			if (!conn.isClosed()) {
				System.out.println("Succeeded connecting to the Database!");
				java.util.Calendar cal = java.util.Calendar.getInstance();
				cal.setTime(new Date());
				cal.add(Calendar.DATE, 1);
				Date nextDate = cal.getTime();
				java.sql.Date sqlDate = new java.sql.Date(nextDate.getTime());
				// String sql = "select pid from play_table where date_format(play_date,
				// '%Y-%m-%d')='" + sqlDate + "' and deleted = 0";
				String sql = "select pid from play_table where date_format(play_date, '%Y-%m-%d')='" + sqlDate
						+ "' and deleted = 0";
				System.out.println(sql);
				Statement statement = conn.createStatement();
				ResultSet rs = statement.executeQuery(sql);
				List<String> list = new ArrayList<String>();
				while (rs.next()) {
					list.add(rs.getString(1));
				}
				System.out.println(list + "  " + list.size());
				if (list.size() != 0) {
					for (String id : list) {
						String delSql = "delete from ptable_file where deleted = 0 and pid = ?";
						PreparedStatement pst = (PreparedStatement) conn.prepareStatement(delSql);
						pst.setInt(1, Integer.parseInt(id));
						pst.executeUpdate();
					}
				}
				if (list.size() != 0) {
					for (String pd : list) {
						String delSqlp = "delete from play_table where deleted = 0 and pid = ?";
						PreparedStatement pst1 = (PreparedStatement) conn.prepareStatement(delSqlp);
						pst1.setInt(1, Integer.parseInt(pd));
						pst1.executeUpdate();
					}
				}
			}
			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void writeSqlPlayFile(int pid, Ad[] ad) throws ParseException {
		try {
			// 加载驱动程序
			Class.forName(driver);
			// 连续数据库
			Connection conn = DriverManager.getConnection(url, user, password);
			if (!conn.isClosed())
				System.out.println("Succeeded connecting to the Database!");

			for (Ad a : ad) {
				System.out.println(a.getFileId() + "----");
			}
//##################################高能区##########################################################

//	原来的版本
			for (int i = 1; i <= ad.length; i++) {
				// statement用来执行SQL语句
				String insertSql = "INSERT INTO ptable_file" + "(mid, pid, num, deleted)" + "values(?,?,?,?)";
				PreparedStatement statement = (PreparedStatement) conn.prepareStatement(insertSql);
				System.out.println(insertSql);
				statement.setInt(1, ad[i - 1].getFileId());
				statement.setInt(2, pid);
				statement.setInt(3, i);
				statement.setInt(4, 0);
				statement.executeUpdate();
			}

//	新版本，解决ptable_file问题,删除与显示问题，目标一个ptable_file就对应一个item
			//先将Ad[i]去重
			//从items表中找到所有的是Ad[i]中对应mid的且符合pid中播放日期，时段的item
			//将以上的item全部插入ptable_file

			System.out.println("#####################################");
			System.out.println("开始制作有itemid的ptable_file!!!!!!!!");
			//在这之前,先针对ad[]稿件找到对应的mid ID的item，返回一个itemList
			//把itemID写入ptabefile
//			String sql = "select it.* from items it  where it.deleted = 0 and pf.deleted = 0 and pf.pid = :pid and it.period_id = (select p.period_id from play_table p where p.deleted = 0 and p.pid = :pid) and (select p.play_date from play_table p where p.deleted = 0 and p.pid = :pid) between it.start_date and it.end_date order by pf.num asc";
//			session.createNativeQuery(sql, Items.class).setParameter("pid", pid).getResultList();
//########################################################################################################


			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static int getReadSqlTable(int terminalId, int periodId) throws ParseException {
		int playId = 0;
		try {
			// 加载驱动程序
			Class.forName(driver);
			// 连续数据库
			Connection conn = DriverManager.getConnection(url, user, password);
			if (!conn.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			// statement用来执行SQL语句
			Statement statement = conn.createStatement();
			ResultSet rs = null;
			String sql = "select pid from play_table where deleted = 0 and terminal_id = " + terminalId
					+ " and  period_id = " + periodId;
			System.out.println(sql);
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				playId = Integer.parseInt(rs.getString(1));
			}
			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return playId;
	}

	// 生成一个播表
	public static void writeSqlTable(int terminalId, int periodId, List<Ad> ad, String uid) throws ParseException {
		Date date = new Date();
		Timestamp timestamp = new Timestamp(date.getTime());
		// SimpleDateFormat f = new SimpleDateFormat("YYYY-MM-DD HH:MM:SS");
		java.util.Calendar cal = java.util.Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, 1);
		Date nextDate = cal.getTime();
		java.sql.Date sqlDate = new java.sql.Date(nextDate.getTime());
		int sum = 0;
		for (Ad a : ad) {
			int d = a.getDuration();
			int f = a.getFreq();
			System.out.println(a.getDuration() + "=" + a.getFreq());
			sum = sum + d * f;
		}
		int min = (int) sum / 60;
		String playtime = sum / 60 + "分" + (sum - min * 60) + "秒";
		int screenTime = getScreenTime(periodId);
		if (screenTime == 0)
			screenTime = 1;
		DecimalFormat df = new DecimalFormat("#0.00");
		int tosum = sum * 100 * 1000;
		double rate = (float) tosum / (float) screenTime;
		// System.out.println(playtime + "=" + screenTime + "=" + rate);
		String screenRate = df.format(rate) + "%";
		screenTime = screenTime / 1000;
		int allTimeMin = (int) screenTime / 60;
		String allTime = screenTime / 60 + "分" + (screenTime - allTimeMin * 60) + "秒";
		try {
			// 加载驱动程序
			Class.forName(driver);
			// 连续数据库
			Connection conn = DriverManager.getConnection(url, user, password);
			if (!conn.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			// statement用来执行SQL语句
			String insertSql = "INSERT INTO play_table"
					+ "(user_id, period_id, terminal_id, status_id, play_date, screen_rate, play_totaltime, all_time, create_time, deleted)"
					+ "values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement statement = (PreparedStatement) conn.prepareStatement(insertSql);
			String sql = "INSERT INTO play_table (user_id, period_id, terminal_id, status_id, create_time, deleted)"
					+ " VALUES (" + 1 + ", " + periodId + ", " + terminalId + ", " + 1 + ", " + timestamp + ", " + 0
					+ ")";

			System.out.println(sql);
			statement.setInt(1, Integer.parseInt(uid));
			statement.setInt(2, periodId);
			statement.setInt(3, terminalId);
			statement.setInt(4, 1);
			statement.setDate(5, sqlDate);
			statement.setString(6, screenRate);
			statement.setString(7, playtime);
			statement.setString(8, allTime);
			statement.setTimestamp(9, new Timestamp(currentTimeMillis()));
			statement.setInt(10, 0);
			int count = statement.executeUpdate();
			System.out.println(count);
			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 生成多个播表
	public static void writeSqlTable(int terminalId, int periodId, List<Ad> ad) throws ParseException {
		Date date = new Date();
		Timestamp timestamp = new Timestamp(date.getTime());
		// SimpleDateFormat f = new SimpleDateFormat("YYYY-MM-DD HH:MM:SS");
		java.util.Calendar cal = java.util.Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, 1);
		Date nextDate = cal.getTime();
		java.sql.Date sqlDate = new java.sql.Date(nextDate.getTime());
		int sum = 0;
		for (Ad a : ad) {
			int d = a.getDuration();
			int f = a.getFreq();
			System.out.println(a.getDuration() + "=" + a.getFreq());
			sum = sum + d * f;
		}
		int min = (int) sum / 60;
		String playtime = sum / 60 + "分" + (sum - min * 60) + "秒";
		int screenTime = getScreenTime(periodId);
		if (screenTime == 0)
			screenTime = 1;
		DecimalFormat df = new DecimalFormat("#0.00");
		int tosum = sum * 100 * 1000;
		double rate = (float) tosum / (float) screenTime;
		// System.out.println(playtime + "=" + screenTime + "=" + rate);
		String screenRate = df.format(rate) + "%";
		screenTime = screenTime / 1000;
		int allTimeMin = (int) screenTime / 60;
		String allTime = screenTime / 60 + "分" + (screenTime - allTimeMin * 60) + "秒";
		try {
			// 加载驱动程序
			Class.forName(driver);
			// 连续数据库
			Connection conn = DriverManager.getConnection(url, user, password);
			if (!conn.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			// statement用来执行SQL语句
			String insertSql = "INSERT INTO play_table"
					+ "(user_id, period_id, terminal_id, status_id, play_date, screen_rate, play_totaltime, all_time, create_time, deleted)"
					+ "values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement statement = (PreparedStatement) conn.prepareStatement(insertSql);
			String sql = "INSERT INTO play_table (user_id, period_id, terminal_id, status_id, create_time, deleted)"
					+ " VALUES (" + 1 + ", " + periodId + ", " + terminalId + ", " + 1 + ", " + timestamp + ", " + 0
					+ ")";

			System.out.println(sql);
			statement.setInt(1, 1);
			statement.setInt(2, periodId);
			statement.setInt(3, terminalId);
			statement.setInt(4, 1);
			statement.setDate(5, sqlDate);
			statement.setString(6, screenRate);
			statement.setString(7, playtime);
			statement.setString(8, allTime);
			statement.setTimestamp(9, new Timestamp(currentTimeMillis()));
			statement.setInt(10, 0);
			int count = statement.executeUpdate();
			System.out.println(count);
			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static int getScreenTime(int periodId) {
		long time = 0;
		try {
			// 加载驱动程序
			Class.forName(driver);
			// 连续数据库
			Connection conn = DriverManager.getConnection(url, user, password);
			if (!conn.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			// statement用来执行SQL语句
			Statement statement = conn.createStatement();
			ResultSet rs = null;
			String sql = "select start_interval, end_interval from period where deleted = 0 and " + " period_id = "
					+ periodId;
			System.out.println(sql);
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				String start = rs.getString(1);
				String end = rs.getString(2);
				DateFormat df = new SimpleDateFormat("HH:mm:ss");
				time = df.parse(end).getTime() - df.parse(start).getTime();
			}
			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (int) time;
	}

	public static String getNameById(int terminalId, int periodId) {
		String city = "";
		String periodName = "";
		try {
			// 加载驱动程序
			Class.forName(driver);
			// 连续数据库
			Connection conn = DriverManager.getConnection(url, user, password);
			if (!conn.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			// statement用来执行SQL语句
			Statement statement = conn.createStatement();
			ResultSet rs = null;
			// String sql = "select start_interval, end_interval from period where deleted =
			// 0 and " + " period_id = " + periodId;
			String sql = "select area_name from terminal where deleted = 0 and terminal_id = " + terminalId;
			System.out.println(sql);
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				String[] s = rs.getString(1).split("省");
				String[] s1 = s[1].split("市");
				city = s1[0];
			}

			String sql1 = "select period_name from period where deleted = 0 and period_id = " + periodId;
			System.out.println(sql1);
			rs = statement.executeQuery(sql1);
			while (rs.next()) {
				periodName = rs.getString(1);
			}
			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return city + "-" + periodName;
	}

	// 7.14
	// 通过播表管理在ptable_file复制一个稿件
	public void copySqlPlayFile(String pid, String mid, int num) throws ParseException {
		try {
			// 加载驱动程序
			Class.forName(driver);
			// 连续数据库
			Connection conn = DriverManager.getConnection(url, user, password);
			if (!conn.isClosed())
				System.out.println("Succeeded connecting to the Database!");

			// statement用来执行SQL语句
			String insertSql = "INSERT INTO ptable_file" + "(mid, pid, num, deleted)" + "values(?,?,?,?)";
			PreparedStatement statement = (PreparedStatement) conn.prepareStatement(insertSql);
			System.out.println(insertSql);
			statement.setInt(1, Integer.parseInt(mid));
			statement.setInt(2, Integer.parseInt(pid));
			statement.setInt(3, num);
			statement.setInt(4, 0);
			statement.executeUpdate();

			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 7.15
	// 通过播表管理在ptable_file删除一个稿件
	public void delSqlPlayFile(String pid, String mid, int num) throws ParseException {
		try {
			// 加载驱动程序
			Class.forName(driver);
			// 连续数据库
			Connection conn = DriverManager.getConnection(url, user, password);
			if (!conn.isClosed())
				System.out.println("Succeeded connecting to the Database!");

			System.out.println("准备在ptable_file删除一个稿件");

			// statement用来执行SQL语句
			String deltSql = "delete from ptable_file where deleted = 0 and mid = ? and pid =? and num=?";
			PreparedStatement statement = (PreparedStatement) conn.prepareStatement(deltSql);
			System.out.println(deltSql);
			statement.setInt(1, Integer.parseInt(mid));
			statement.setInt(2, Integer.parseInt(pid));
			statement.setInt(3, num);
			statement.executeUpdate();
			System.out.println("从ptable_file删除成功");
			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 通过播表管理在ptable_file根据pid删除该pid的所有稿件
	public void delAllSqlPlayFile(String pid)  {
		try {
			// 加载驱动程序
			Class.forName(driver);
			// 连续数据库
			Connection conn = DriverManager.getConnection(url, user, password);
			if (!conn.isClosed())
				System.out.println("Succeeded connecting to the Database!");

			// statement用来执行SQL语句
			String deltSql = "delete from ptable_file where deleted = 0 and  pid =? ";
			PreparedStatement statement = (PreparedStatement) conn.prepareStatement(deltSql);
			System.out.println(deltSql);

			statement.setInt(1, Integer.parseInt(pid));

			statement.executeUpdate();

			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		TableAutoGenerate tag = new TableAutoGenerate();
		tag.deleteOldPlayTable();
	}
}
