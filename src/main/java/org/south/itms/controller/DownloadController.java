package org.south.itms.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.south.itms.entity.Material;
import org.south.itms.mail.PtableSendingStateMail;
import org.south.itms.service.impl.MaterialService;
import org.south.itms.util.Constant;
import org.south.itms.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author: yezilong
 */

@Controller  
@RequestMapping("/downloadController")  
public class DownloadController {  
	
	@Autowired
	private MaterialService materialService;
	
	
	private static final String Separated = ",";

	private String[] mids;

	private class MaterialInfo{
		private String mid;
		private String terminalId;
		private String materialName;
		private String terminalName;

		public String getMid() {
			return mid;
		}

		public void setMid(String mid) {
			this.mid = mid;
		}

		public String getTerminalId() {
			return terminalId;
		}

		public void setTerminalId(String terminalId) {
			this.terminalId = terminalId;
		}

		public String getMaterialName() {
			return materialName;
		}

		public void setMaterialName(String materialName) {
			this.materialName = materialName;
		}

		public String getTerminalName() {
			return terminalName;
		}

		public void setTerminalName(String terminalName) {
			this.terminalName = terminalName;
		}
	}

	private ArrayList<MaterialInfo> materialInfoList = new ArrayList<>();
	
	
	/*
		具体代码实现: 
		1、在服务器端创建一个临时zip格式文件 
		2、用jdk自带的API将服务器所有文件输入到zip文件中 
		3、将zip文件下载到本地，并删除服务器端zip文件
	 */
	
	@RequestMapping(value = "/downloadZip")
    public String downloadFiles(String fileIds, HttpServletResponse response) {
		System.out.println("array= " + fileIds);
		try {
			if(StringUtil.isEmpty(fileIds)) {
				return null;
			}
			// 判断目录是否存在，不存在就创建
			File directoryFile = new File(Constant.TmpZipPath);
			if (!directoryFile.exists()) {
				directoryFile.mkdirs();
			}
			
			
	        List<File> files = new ArrayList<File>();
	        String[] fids = fileIds.split(Separated);

	        // 先清空要发送的素材信息表
			materialInfoList.clear();
			MaterialInfo materialInfo = new MaterialInfo();

	        for(String fid : fids) {
	        	Material myFile = materialService.getById(fid);
	        	if(myFile != null) {
	        		File file = new File(myFile.getFilePath());

	        		// 记录信息,为可能的发送错误做准备
					materialInfo.setMid(fid);
					materialInfo.setTerminalId(myFile.getTerminal().getTerminalId());
					materialInfo.setMaterialName(myFile.getMaterialName());
					materialInfo.setTerminalName(myFile.getTerminal().getTerminalName());
					materialInfoList.add(materialInfo);

	        		if(file.exists()) {
						files.add(file);
					}
	        	}
	        } 
	        if(files.size() < 1) {
				return null;
			}
	        
	        String fileName = UUID.randomUUID().toString() + ".zip";
	
	        File fileZip = new File(Constant.TmpZipPath + fileName);
	        // 文件输出流
	        FileOutputStream outStream = new FileOutputStream(fileZip);
	        // 压缩流
	        ZipOutputStream toClient = new ZipOutputStream(outStream);
	        // toClient.setEncoding("gbk");
	        zipFile(files, toClient);
	        toClient.close();
	        outStream.close();
	        this.downloadFile(fileZip, response, true);
		} catch(Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
        return null;
    }
	
	
	
	public static void zipFile(List<File> files, ZipOutputStream outputStream) throws IOException, ServletException {
        try {
            int size = files.size();
            // 压缩列表中的文件
            for (int i = 0; i < size; i++) {
                File file = (File) files.get(i);
                zipFile(file, outputStream);
            }
        } catch (IOException e) {
            throw e;
        }
    }
	
	
	//将服务器文件存到压缩包中
    public static void zipFile(File inputFile, ZipOutputStream outputstream) throws IOException, ServletException {
        try {
            if (inputFile.exists()) {
                if (inputFile.isFile()) {
                    FileInputStream inStream = new FileInputStream(inputFile);
                    BufferedInputStream bInStream = new BufferedInputStream(inStream);
                    ZipEntry entry = new ZipEntry(inputFile.getName());
                    outputstream.putNextEntry(entry);

                    final int MAX_BYTE = 10 * 1024 * 1024; // 最大的流为10M
                    long streamTotal = 0; // 接受流的容量
                    int streamNum = 0; // 流需要分开的数量
                    int leaveByte = 0; // 文件剩下的字符数
                    byte[] inOutbyte; // byte数组接受文件的数据

                    streamTotal = bInStream.available(); // 通过available方法取得流的最大字符数
                    streamNum = (int) Math.floor(streamTotal / MAX_BYTE); // 取得流文件需要分开的数量
                    leaveByte = (int) streamTotal % MAX_BYTE; // 分开文件之后,剩余的数量

                    if (streamNum > 0) {
                        for (int j = 0; j < streamNum; ++j) {
                            inOutbyte = new byte[MAX_BYTE];
                            // 读入流,保存在byte数组
                            bInStream.read(inOutbyte, 0, MAX_BYTE);
                            outputstream.write(inOutbyte, 0, MAX_BYTE); // 写出流
                        }
                    }
                    // 写出剩下的流数据
                    inOutbyte = new byte[leaveByte];
                    bInStream.read(inOutbyte, 0, leaveByte);
                    outputstream.write(inOutbyte);
                    outputstream.closeEntry(); // Closes the current ZIP entry
                    // and positions the stream for
                    // writing the next entry
                    bInStream.close(); // 关闭
                    inStream.close();
                }
            } else {
                throw new ServletException("文件不存在！");
            }
        } catch (IOException e) {
            throw e;
        }
    }
	
    //下载文件
    public void downloadFile(File file,HttpServletResponse response,boolean isDelete){
            // 以流的形式下载文件。
    	   FileInputStream fis = null;
    	   ServletOutputStream toClient = null;
    		try {
    			// 清空response
    		   response.reset();
    		   response.setContentType("application/octet-stream");
    		   response.setHeader("Content-Disposition", "attachment;filename=" + new String(file.getName().getBytes("UTF-8"),"ISO-8859-1"));
    		   fis = new FileInputStream(file.getPath());
    		   System.out.println("文件地址："+file.getPath());
    		   byte[] buffer = new byte[fis.available()];
    		   toClient = response.getOutputStream();
    		   int length = 0;
    		   while((length = fis.read(buffer))>0) {
    			   toClient.write(buffer, 0, length);
    		   }

    		}catch (IOException e) {

    			// 这里发生了IO错误，应该发送邮件给管理员

				String content = "<b>南方LED管理员您好!下面是来自稿件传输自检模块的诊断报告:</b>";
				String senderNickname = "ITMS稿件传输自检模块";
				String ITMSAdminEmailAddr = Constant.ITMSAdminEmailAddr;
				String subject = "稿件传输自检结果报告";


				for (MaterialInfo m : materialInfoList){
					String tempContent = "";
					tempContent += "<p>在终端ID"+ m.getTerminalId() +":" + m.getTerminalName() + "下</p>"
								+  "<p>稿件ID:" + m.getMid() + "," + m.getMaterialName() +  "可能出现传输问题，请检查处理</p>"
								+  "<br />";
					content += tempContent;
				}
				PtableSendingStateMail.send(senderNickname,subject,content,ITMSAdminEmailAddr);
    			System.out.println("reason:"+e.getMessage());

			}finally {
				try {
					if(fis!=null) {
						fis.close();
					}
					if(toClient!=null) {
			    		toClient.flush();
			    		toClient.close();
					}
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}
            if(isDelete)
            {
                file.delete();        //是否将生成的服务器端文件删除
            }

    } 
    
	//web展示视频
	@RequestMapping(value = "/showVedio")
	public void showVedio(String filename, HttpServletResponse response) {

		try {
			if (StringUtil.isEmpty(filename)) {
				return;
			}

			File file = new File(Constant.UPLOADDIRECORY + filename);

			if (!file.exists()) {
				return;
			}
			downloadFile(file, response, false);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}  
