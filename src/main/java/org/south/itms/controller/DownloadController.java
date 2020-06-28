package org.south.itms.controller;

import java.io.*;
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
import org.south.itms.service.impl.MaterialService;
import org.south.itms.util.Constant;
import org.south.itms.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * @author: yezilong
 */

@Controller  
@RequestMapping("/downloadController")  
public class DownloadController {  
	
	@Autowired
	private MaterialService materialService;
	
	
	private static final String Separated = ",";
	
	
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
			if(StringUtil.isEmpty(fileIds)) return null;
			// 判断目录是否存在，不存在就创建
			File directoryFile = new File(Constant.TmpZipPath);
			if (!directoryFile.exists())
				directoryFile.mkdirs();
			
			
	        List<File> files = new ArrayList<File>();
	        String[] fids = fileIds.split(Separated);
	        for(String fid : fids) {
	        	Material myFile = materialService.getById(fid);
	        	if(myFile != null) {
	        		File file = new File(myFile.getFilePath());
	        		if(file.exists()) files.add(file);
	        	}
	        } 
	        if(files.size() < 1) return null;
	        
	        String fileName = UUID.randomUUID().toString() + ".zip";
	
	        File fileZip = new File(Constant.TmpZipPath + fileName);
	        // 文件输出流
	        FileOutputStream outStream = new FileOutputStream(fileZip);
	        // 压缩流
	        ZipOutputStream toClient = new ZipOutputStream(outStream);
	        //  toClient.setEncoding("gbk");
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
    			System.out.println("reason:"+e.getMessage());
//				e.printStackTrace();
			}finally {
				try {
					if(fis!=null)
					  fis.close();
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
			if (StringUtil.isEmpty(filename))
				return;

			File file = new File(Constant.UPLOADDIRECORY + filename);

			if (!file.exists())
				return;
			downloadFile(file, response, false);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * video请求位置
	 *
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/player", method = RequestMethod.GET)
	public void player2(String filename, HttpServletRequest request, HttpServletResponse response) {
		//String path = request.getServletContext().getRealPath("/static/my/video/interview.mp4");
		BufferedInputStream bis = null;
		try {
			File file = new File(Constant.UPLOADDIRECORY + filename);
			if (file.exists()) {
				long p = 0L;
				long toLength = 0L;
				long contentLength = 0L;
				int rangeSwitch = 0; // 0,从头开始的全文下载；1,从某字节开始的下载（bytes=27000-）；2,从某字节开始到某字节结束的下载（bytes=27000-39000）
				long fileLength;
				String rangBytes = "";
				fileLength = file.length();

				// get file content
				InputStream ins = new FileInputStream(file);
				bis = new BufferedInputStream(ins);

				// tell the client to allow accept-ranges
				response.reset();
				response.setHeader("Accept-Ranges", "bytes");

				// client requests a file block download start byte
				String range = request.getHeader("Range");
				if (range != null && range.trim().length() > 0 && !"null".equals(range)) {
					response.setStatus(javax.servlet.http.HttpServletResponse.SC_PARTIAL_CONTENT);
					rangBytes = range.replaceAll("bytes=", "");
					if (rangBytes.endsWith("-")) { // bytes=270000-
						rangeSwitch = 1;
						p = Long.parseLong(rangBytes.substring(0, rangBytes.indexOf("-")));
						contentLength = fileLength - p; // 客户端请求的是270000之后的字节（包括bytes下标索引为270000的字节）
					} else { // bytes=270000-320000
						rangeSwitch = 2;
						String temp1 = rangBytes.substring(0, rangBytes.indexOf("-"));
						String temp2 = rangBytes.substring(rangBytes.indexOf("-") + 1, rangBytes.length());
						p = Long.parseLong(temp1);
						toLength = Long.parseLong(temp2);
						contentLength = toLength - p + 1; // 客户端请求的是 270000-320000 之间的字节
					}
				} else {
					contentLength = fileLength;
				}

				// 如果设设置了Content-Length，则客户端会自动进行多线程下载。如果不希望支持多线程，则不要设置这个参数。
				// Content-Length: [文件的总大小] - [客户端请求的下载的文件块的开始字节]
				response.setHeader("Content-Length", new Long(contentLength).toString());

				// 断点开始
				// 响应的格式是:
				// Content-Range: bytes [文件块的开始字节]-[文件的总大小 - 1]/[文件的总大小]
				if (rangeSwitch == 1) {
					String contentRange = new StringBuffer("bytes ").append(new Long(p).toString()).append("-")
							.append(new Long(fileLength - 1).toString()).append("/")
							.append(new Long(fileLength).toString()).toString();
					response.setHeader("Content-Range", contentRange);
					bis.skip(p);
				} else if (rangeSwitch == 2) {
					String contentRange = range.replace("=", " ") + "/" + new Long(fileLength).toString();
					response.setHeader("Content-Range", contentRange);
					bis.skip(p);
				} else {
					String contentRange = new StringBuffer("bytes ").append("0-").append(fileLength - 1).append("/")
							.append(fileLength).toString();
					response.setHeader("Content-Range", contentRange);
				}

				String fileName = file.getName();
				response.setContentType("application/octet-stream");
				response.addHeader("Content-Disposition", "attachment;filename=" + fileName);

				OutputStream out = response.getOutputStream();
				int n = 0;
				long readLength = 0;
				int bsize = 1024;
				byte[] bytes = new byte[bsize];
				if (rangeSwitch == 2) {
					// 针对 bytes=27000-39000 的请求，从27000开始写数据
					while (readLength <= contentLength - bsize) {
						n = bis.read(bytes);
						readLength += n;
						out.write(bytes, 0, n);
					}
					if (readLength <= contentLength) {
						n = bis.read(bytes, 0, (int) (contentLength - readLength));
						out.write(bytes, 0, n);
					}
				} else {
					while ((n = bis.read(bytes)) != -1) {
						out.write(bytes, 0, n);
					}
				}
				out.flush();
				out.close();
				bis.close();
			}
		} catch (IOException ie) {
			// 忽略 ClientAbortException 之类的异常
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



}  
