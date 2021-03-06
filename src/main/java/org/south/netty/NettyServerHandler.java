package org.south.netty;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.netty.channel.ChannelFuture;
import org.south.itms.controller.FileController;
import org.south.itms.dao.impl.FileDao;
import org.south.itms.dao.impl.LogDao;
import org.south.itms.dao.impl.MarqueeDao;
import org.south.itms.dao.impl.TerminalDao;
import org.south.itms.dto.Result;
import org.south.itms.entity.Marquee;
import org.south.itms.entity.Material;
import org.south.itms.entity.Period;
import org.south.itms.entity.PlayTable;
import org.south.itms.entity.Terminal;
import org.south.itms.service.impl.MarqueeService;
import org.south.itms.util.SpringContextHelper;
import org.south.itms.util.SqlUpdate;
import org.south.itms.util.StringUtil;
import org.south.netty.msg.BaseMsg;
import org.south.netty.msg.ClientLogMsg;
import org.south.netty.msg.DataKey;
import org.south.netty.msg.FileDto;
import org.south.netty.msg.FileInfoDto;
import org.south.netty.msg.InsertDto;
import org.south.netty.msg.InsertVedioDto;
import org.south.netty.msg.MarqueeInfoDto;
import org.south.netty.msg.MsgType;
import org.south.netty.msg.OffsetFileMsg;
import org.south.netty.msg.ResultMsg;
import org.south.netty.msg.ValidateMsg;
import org.springframework.beans.factory.annotation.Autowired;

import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.socket.SocketChannel;

/**
 * @author: yezilong
 */

public class NettyServerHandler extends SimpleChannelInboundHandler<BaseMsg> {
	
	//private ChannelHandlerContext ctx = null;

	private TerminalDao terminalDao = (TerminalDao) SpringContextHelper.getBean("terminalDao");

	private FileDao fileDao =  (FileDao) SpringContextHelper.getBean("fileDao");
	
	private FileController fileController =  (FileController) SpringContextHelper.getBean("fileController");
	
    private MarqueeDao marqueeService = (MarqueeDao) SpringContextHelper.getBean("marqueeDao");
	
	private LogDao logDao =  (LogDao) SpringContextHelper.getBean("logDao");
	
	@Override
	protected void channelRead0(ChannelHandlerContext ctx, BaseMsg msg) throws Exception {
		switch (msg.getMsgType()) {
			case Heartbeat: // 是心跳包就忽略掉
				SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				System.out.print(form.format(new java.util.Date()));
				System.out.println("  server println Heartbeat");
				break;
	
			case UpdatePtable:   //第二天自动更新播表  和　case Validate: 一样的操作
				System.out.println("第二天自动更新播表");
				
			case Validate: // 客户端请求连接服务器
				System.out.println(" 客户端请求连接服务器 ");
				ValidateMsg validateMsg = (ValidateMsg) msg;
				Terminal termianl = terminalDao.findByCondition(validateMsg.getAccount(), validateMsg.getPassword());
				System.out.println(termianl);
				if (termianl == null) {
					ctx.writeAndFlush(new ResultMsg(MsgType.Validate, "播放端连接失败, 请检查序列号和密码是否正确"));
				} else {
					
					SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
				
					 // 验证成功, 将建立播放端主键与channel的关系
					if(validateMsg.getMsgType() != MsgType.UpdatePtable && NettyChannelMap.containsKey(termianl.getTerminalId())) {  //如果是重新连接,那么旧的channel需要注销掉
						Channel channel = NettyChannelMap.get(termianl.getTerminalId());
						ResultMsg logicClose = new ResultMsg();
						logicClose.setReplyType(MsgType.LogicClose);
						channel.writeAndFlush(logicClose);
					}
					NettyChannelMap.add(termianl.getTerminalId(), (SocketChannel)ctx.channel()); 
	                System.out.println("channel server=" + NettyChannelMap.get(termianl.getTerminalId()));
					System.out.println("channel length = " + NettyChannelMap.getMap().size());
	                //通知客户端, 验证成功
					ResultMsg resultMsg = new ResultMsg(true, MsgType.Validate);
					//返回播放端的主键
					Map<String, Object> data = new HashMap<String, Object>();
					data.put(DataKey.TerminalId, termianl.getTerminalId());
					data.put(DataKey.TerminalName, termianl.getTerminalName());
					data.put(DataKey.startSpotTop, termianl.getStartSpotTop());
					data.put(DataKey.startSpotLeft, termianl.getStartSpotLeft());
					data.put(DataKey.ledWidth, termianl.getLedWidth());
					data.put(DataKey.ledLength, termianl.getLedLength());
					//返回播放端的播放表有哪些视频列表
					//List<FileDto> vediofiles = new ArrayList<FileDto>();
					List<FileInfoDto> vediofiles = new ArrayList<FileInfoDto>();
					List<MarqueeInfoDto> marqueefiles = new ArrayList<MarqueeInfoDto>();
					//List<File> files = fileDao.findByPtable(termianl.getTerminalId());
					System.out.println(data);
					System.out.println("success!!!!!!!");
					//List<PlayTable> plays = fileDao.findByTerminalId(termianl.getTerminalId());

					// 这里找的是今天的播表
					List<PlayTable> plays = terminalDao.findByTerminalId(termianl.getTerminalId());
					//System.out.println(plays);
					//SqlUpdate sql = new SqlUpdate();
					
					if(plays.size() != 0) {
						for(PlayTable pt : plays) {
							if(pt.getInsertFlag() == 1) {
								continue; //是插播的话直接跳过
							}
							List<Material> fs = fileDao.findByPtable(pt.getPid());
							//List<Material> fs = sql.findByPtable(pt.getPid());
							System.out.println("fs=" + fs);
							for(Material f:fs) {
								System.out.println(f);
							}
							Period period = fileDao.findByPeriod(pt.getPeriodId());
							FileInfoDto fileInfo = new FileInfoDto();
							fileInfo.setFlag(0);
							fileInfo.setPeriodId(pt.getPeriodId());
							fileInfo.setPname(pt.getPtableName());
							fileInfo.setPid(pt.getPid());
							//System.out.println("start=" + format.format(period.getStartInterval()));
							//System.out.println("start1=" + period.getStartInterval().toString());
							fileInfo.setStart(format.format(period.getStartInterval()));
							fileInfo.setEnd(format.format(period.getEndInterval()));
							//fileInfo.setEnd(period.getEndInterval());
							//fileInfo.setStart(period.getStartInterval());
							ArrayList<FileDto> fileDto = new ArrayList<FileDto>();
							for(Material file : fs) {
								fileDto.add(new FileDto(file.getMid(), StringUtil.getFileName(file.getFilePath()), file.getFileName(), file.getMd5()));
							}
							fileInfo.setListFile(fileDto);
							vediofiles.add(fileInfo);
						}
						System.out.println(vediofiles.size());
						System.out.println(vediofiles);
						
						//插播
						List<InsertDto> insertDto = new ArrayList<InsertDto>();
						List<PlayTable> ipTable = terminalDao.findInsertByTerminalId(termianl.getTerminalId());
						System.out.println("Iptable===" + ipTable);
						if(ipTable == null || ipTable.size() == 0 ) {
		                	System.out.println("插播为空");
		                }else {
		                	for(PlayTable ip : ipTable) {
		                		List<Material> listMaterial = terminalDao.findAllMaterial(ip.getPid());
		                		InsertDto dto = new InsertDto();
		                		int sum = 0;
		                		List<String> mid = new ArrayList<String>();
		                		List<String> fileName = new ArrayList<String>();
		                		List<String> logicName = new ArrayList<String>();
		                		List<String> md5 = new ArrayList<String>();
		                		for(Material m : listMaterial) {
		                			mid.add(m.getMid());
		                			String[] insertFileName = m.getFilePath().split("/");
		                			fileName.add(insertFileName[insertFileName.length - 1]);
		                			logicName.add(m.getMaterialName());
		                			md5.add(m.getMd5());
		                			sum = sum + m.getDuration();
		                		}
		                		dto.setEnd(format.format(ip.getEndTime()));
			                	dto.setStart(format.format(ip.getStartTime()));
			                	dto.setStatus("" + ip.getState());
			                	dto.setMin("" + ip.getMin());
			                	dto.setDuration("" + sum);
			                	dto.setMid(mid);
			                	dto.setFileName(fileName);
			                	dto.setLogicName(logicName);
			                	dto.setMd5(md5);
			                	insertDto.add(dto);
		                	}
		                }
						
						data.put(DataKey.vediofiles, vediofiles);
						data.put(DataKey.insertfiles, insertDto);
//						resultMsg.setData(data);
//						System.out.println(resultMsg);
//						ctx.writeAndFlush(resultMsg);
					}
					SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
					Date now = new Date();
					String today = format2.format(now);
					List<Marquee> marquees = marqueeService.findMarqueeByTerminalIdBetweenDates(termianl.getTerminalId(), today, today);
					System.out.println(marquees);
					if(marquees.size()!=0) { //有需要播放的跑马灯
						for(Marquee marquee : marquees )
						{
							ArrayList<FileDto> fileDto = new ArrayList<FileDto>();
							MarqueeInfoDto marqueeInfoDto = new MarqueeInfoDto();
							Period period2 = fileDao.findByPeriod(marquee.getPeriodId());
							marqueeInfoDto.setMarqueeName(marquee.getMarqName());
							marqueeInfoDto.setPeriodId(marquee.getPeriodId());
							marqueeInfoDto.setMid(marquee.getMaterialId());
							marqueeInfoDto.setPositionX(marquee.getPositionX());
							marqueeInfoDto.setPositionY(marqueeInfoDto.getPositionY());
							FileDto file = new FileDto(marquee.getMaterialId(), StringUtil.getFileName(marquee.getFilePath()), marquee.getFileName(), marquee.getMd5());
							fileDto.add(file);
							marqueeInfoDto.setStart(format.format(period2.getStartInterval()));
							marqueeInfoDto.setEnd(format.format(period2.getEndInterval()));
							marqueeInfoDto.setFile(fileDto);
							marqueefiles.add(marqueeInfoDto);
						}
						data.put(DataKey.MarqueeFiles,marqueefiles);
					}

					System.out.println("send data:"+data);
					resultMsg.setData(data);
					ChannelFuture cf = ctx.writeAndFlush(resultMsg);

					if (cf.isSuccess()){

						// modify by bobo
						// 这里更新发送成功的播表状态
						SqlUpdate sqlUpdate = new SqlUpdate();
						for (PlayTable pt : plays) {
							sqlUpdate.updatePtableSendingState(pt.getPid(),1);
						}

						System.out.println("客户端主动请求的播表发送成功");
					}else{
						System.out.println("客户端主动请求的播表发送失败");
					}
				}
				break;
				
			case OffsetFile:
				OffsetFileMsg offsetFileMsg = (OffsetFileMsg)msg;
				Result result = fileController.transferFile(offsetFileMsg.getNofileIds().toArray(new String[offsetFileMsg.getNofileIds().size()]), new String[]{offsetFileMsg.getTerminalId()}, true);
				ResultMsg resultMsg = new ResultMsg(true, MsgType.OffsetComplete);
				Map<String, Object> data = new HashMap<String, Object>();
				data.put(DataKey.resultId, result);
				resultMsg.setData(data);
				ctx.writeAndFlush(resultMsg);
				break;
				
			case ClientLogMsg:  //回传的日志
				logDao.batchInsertLog((ClientLogMsg) msg);
				break;
				
				
			default:
				break;
		}
	}
	
	
    @Override  
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {  
        NettyChannelMap.remove((SocketChannel)ctx.channel());  
    }  
	
	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
		cause.printStackTrace();
		NettyChannelMap.remove((SocketChannel)ctx.channel());
		ctx.close();
	}

}
