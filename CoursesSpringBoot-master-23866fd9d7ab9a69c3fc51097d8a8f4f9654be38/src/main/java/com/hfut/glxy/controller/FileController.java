//package com.hfut.glxy.controller;
//
//import com.hfut.glxy.dto.Result;
//import com.hfut.glxy.entity.Office;
//import com.hfut.glxy.entity.Picture;
//import com.hfut.glxy.entity.Video;
//import com.hfut.glxy.mapper.Video_PictureDao;
//import com.hfut.glxy.service.OfficeService;
//import com.hfut.glxy.service.PictureService;
//import com.hfut.glxy.service.VideoService;
//import com.hfut.glxy.utils.*;
//import net.coobird.thumbnailator.Thumbnails;
//import org.apache.commons.io.FileUtils;
//import org.apache.commons.lang3.StringUtils;
//import org.jodconverter.DocumentConverter;
//import org.jodconverter.document.DefaultDocumentFormatRegistry;
//import org.jodconverter.office.OfficeException;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//
//import javax.annotation.Resource;
//import java.io.File;
//import java.io.IOException;
//import java.io.InputStream;
//import java.util.HashMap;
//import java.util.Map;
//
///**
// * @author chenliangliang
// * @date 2017/12/4
// */
//@Controller
//@RequestMapping(value = "/file")
////@CrossOrigin(origins = "*",methods = {RequestMethod.PUT,RequestMethod.POST,RequestMethod.GET,RequestMethod.OPTIONS,RequestMethod.DELETE})
//public class FileController {
//
//
//    private String viewDir = "view";
//
//    private String viewPath = viewDir + "/";
//
//    @Value("${file.location}")
//    private String filePath;
//    //@Value("${net.path}")
//    //private String netPath;
//
//    private OfficeService officeService;
//
//    @Resource
//    private Video_PictureDao video_pictureDao;
//
//    private PictureService pictureService;
//
//    private VideoService videoService;
//
//    private DocumentConverter converter;
//
//    @Autowired
//    protected FileController(PictureService pictureService, DocumentConverter converter,
//                             OfficeService officeService, VideoService videoService) {
//        this.pictureService = pictureService;
//        this.converter = converter;
//        this.officeService = officeService;
//        this.videoService=videoService;
//    }
//
//
//    @GetMapping
//    public String upload() {
//        return "upload";
//    }
//
//
//    @GetMapping("/video")
//    public String video() {
//        return "video";
//    }
//
//    @GetMapping("/view/{file}")
//    public String view(@PathVariable("file") String file,
//                       ModelMap map) {
//        map.addAttribute("url","/pdfjs/web/viewer.html?file=/view/"+file+".pdf");
//        return "pdf/pdf";
//    }
//
//
//    /**
//     * 上传图片接口
//     *
//     * @param file
//     * @return
//     */
//    @ResponseBody
//    @PostMapping("/pic")
//    public Result savePic(@RequestParam("file") MultipartFile file) {
//        if (file.isEmpty()) {
//            return ResultUtil.fail("上传的图片不能为空");
//        }
//        String type = file.getContentType();
//        //String url;
//        if (type.contains("image")) {
//            Picture picture = new Picture();
//            String originalFilename = file.getOriginalFilename();
//            System.out.println("filename--->" + originalFilename);
//            String picPath = filePath + "pic/";
//            String[] strs = StringUtils.split(originalFilename, ".");
//            try (InputStream in = file.getInputStream()) {
//                String filename = StringRandom.random(20) + "." + strs[1];
//                //url = netPath + "pic/" + filename;
//                Thumbnails.of(in).scale(1.0).outputQuality(0.25f).toFile(new File(picPath + filename));
//                picture.setDescription(originalFilename);
//                picture.setUrl("/pic/" + filename);
//                if (pictureService.insert(picture)) {
//                    return ResultUtil.OK(picture);
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//
//            }
//
//        } else {
//            return ResultUtil.fail("上传的不是图片类型");
//        }
//        return ResultUtil.fail("保存图片失败");
//
//    }
//
//
//    /**
//     * 上传视频接口
//     *
//     * @param file
//     * @return
//     */
//    @ResponseBody
//    @PostMapping(value = "/video")
//    public Result saveVideo(@RequestParam("file") MultipartFile file) {
//
//        if (file.isEmpty()) {
//            return ResultUtil.fail("上传的视频不能为空");
//        }
//
//        String originalFilename = file.getOriginalFilename();
//        if (!VideoUtil.check(originalFilename)) {
//            return ResultUtil.fail("视频格式不支持");
//        }
//
//        String url;
//        String videoPath = filePath + "video/";
//        Video video=new Video();
//        try {
//
//            String fileType = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
//            String fileName=DateUtil.dateTimeString()+"."+fileType;
//            url = "/video/" + fileName;
//            String videoFile = videoPath + fileName;
//            //String cover = "img/" + StringRandom.random(20) + ".jpg";
//            file.transferTo(new File(videoFile));
//           video.setUrl(url);
//            //获取视频封面
////            if (VideoUtil.cutImg(videoFile, videoPath + cover, 16)) {
////                map.put("cover", "/video/" + cover);
////            } else {
////                map.put("cover", null);
////            }
//           if( videoService.insert(video)){
//
//               /*System.out.println("video_id: "+video.getId() );*/
//                String picture_id="2";
//                video_pictureDao.addRelation(Integer.toString(video.getId()),picture_id);
//
//                return ResultUtil.OK(video);
//
//            }else{
//               return ResultUtil.fail("视频插入失败");
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            return ResultUtil.fail("服务器保存视频失败");
//        }
//
//    }
//
//
//    /**
//     * 上传word文件接口
//     *
//     * @param file
//     * @return
//     * @throws IOException
//     */
//    /*@ResponseBody
//    @PostMapping("/word")
//    public Result saveWord(@RequestParam("file") MultipartFile file) {
//        if (file.isEmpty()) {
//            return ResultUtil.fail("上传的Word文件不能为空");
//        }
//        String filename = file.getOriginalFilename();
//        String[] strs = StringUtils.split(filename, ".");
//        String suffix = strs[strs.length - 1];
//        if (!(StringUtils.equals(suffix, "doc") || StringUtils.equals(suffix, "docx"))) {
//            return ResultUtil.fail("格式错误，请确认上传的是Word文件");
//        }
//
//        String wordPath = filePath + "word/";
//        String htmlPath = wordPath + "html/";
//        Map<String, String> map = new HashMap<>(2);
//
//        try {
//            filename = StringRandom.random(20);
//            String htmlFile = filename + ".html";
//            String wordFile = filename + "." + suffix;
//            file.transferTo(new File(wordPath + wordFile));
//            map.put("wordUrl",  "/word/" + wordFile);
//            if (WordUtil.wordToHtml(wordPath + wordFile, htmlPath, htmlFile)) {
//                map.put("htmlUrl",  "/word/html/" + htmlFile);
//            } else {
//                map.put("htmlUrl", null);
//            }
//            return ResultUtil.OK(map);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return ResultUtil.fail("服务器保存Word文件失败");
//        }
//
//
//    }*/
//
//
//    @PostMapping("/office")
//    @ResponseBody
//    public Result saveOffice(@RequestParam("file") MultipartFile file,
//                             @RequestParam(value = "desc", required = false) String desc) {
//
//        if (file.isEmpty()) {
//            return ResultUtil.fail("上传的office文件不能为空");
//        }
//
//        String originName = file.getOriginalFilename();
//        String fileType = originName.substring(originName.lastIndexOf(".") + 1);
//        boolean convert = true;
//        if (!OfficeUtil.convertible(fileType)) {
//            if (StringUtils.equalsIgnoreCase("pdf", fileType)) {
//                convert = false;
//            } else {
//                return ResultUtil.fail("文件类型不支持");
//            }
//        }
//
//        String fileName = DateUtil.dateTimeString();
//        String inFileName = fileName + "." + fileType;
//        File outFile = new File(filePath + viewPath);
//        if (!outFile.exists()) {
//            outFile.mkdirs();
//        }
//
//        try {
//            //写入本地
//            File inFile = new File(filePath + inFileName);
//            FileUtils.copyInputStreamToFile(file.getInputStream(), inFile);
//            String outFileName;
//            if (convert) {
//
//                outFileName = viewPath + fileName + ".pdf";
//                //文件类型转换
//                converter.convert(inFile)
//                        .as(DefaultDocumentFormatRegistry.getFormatByExtension(fileType))
//                        .to(new File(filePath + outFileName))
//                        .as(DefaultDocumentFormatRegistry.getFormatByExtension("pdf"))
//                        .execute();
//
//            } else {
//                outFileName = inFileName;
//            }
//
//            //截取封面
//            String cover= DateUtil.dateTimeString()+".png";
//
//            OfficeUtil.cutPDFImage(filePath+outFileName,0,filePath+"pic/"+cover);
//
//            Office office = new Office();
//            office.setName(originName);
//            office.setDescription(desc);
//            office.setType(fileType);
//            office.setViewUrl("/"+outFileName);
//            office.setFileUrl("/"+inFileName);
//            office.setCover("/pic/"+cover);
//
//            if (officeService.insert(office)) {
//                return ResultUtil.OK(office);
//            }
//
//        } catch (IOException | OfficeException e) {
//            e.printStackTrace();
//        }
//
//        return ResultUtil.fail("fail");
//    }
//
//
//}
