package com.hfut.glxy.controller;

import com.hfut.glxy.dto.PageResult;
import com.hfut.glxy.dto.Result;
import com.hfut.glxy.entity.Video;
import com.hfut.glxy.mapper.PictureDao;
import com.hfut.glxy.mapper.Unit_VideoDao;
import com.hfut.glxy.mapper.Video_PictureDao;
import com.hfut.glxy.service.VideoService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * ProjectName: Courses <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2018/1/19 12:32 <br/>
 *
 * @author students_ManagementSchool
 * @since JDK 1.8
 */
@Controller
public class VideoController {

    @Resource
    private VideoService videoService;
    @Resource
    private Unit_VideoDao unit_videoDao;
    @Resource
    private Video_PictureDao video_pictureDao;
    @Resource
    private PictureDao pictureDao;

    /**
     *
     * @Date 2018/1/19 13:07
     * @author students_ManagementSchool
     * @param map
     * @return
     * @since JDK 1.8
     * @condition  删除video文件
     */
    @Transactional
    @ResponseBody
    @RequestMapping(value = "/deleteVideoById",method = RequestMethod.POST)
    public Result<String> deleteVideo(@RequestBody Map map){

        String video_id=(String) map.get("video_id");
        String unit_id=(String) map.get("unit_id");

        if (video_id==null||video_id.trim().isEmpty()){
            return new Result<>(false,"教学视频id不存在",null);
        }

        try{
            if (videoService.deleteById(Integer.parseInt(video_id))){

                if (unit_id==null){

                }else{
                    int deleteSuccess=unit_videoDao.deleteRelation(unit_id,video_id);
                    if (deleteSuccess!=1){
                        throw new RuntimeException("删除异常");
                    }

                    String picture_id=video_pictureDao.getPictureByVideo(video_id);
                    int deletePictureSuccess=pictureDao.deletePictureById(picture_id);
                    if (deletePictureSuccess!=1){
                        throw new RuntimeException("删除图片异常");
                    }

                    Integer deleteRelation_PVSuccess=video_pictureDao.deleteRelation(video_id);
                    if (deleteRelation_PVSuccess==null){
                        throw new RuntimeException("删除图片视频关联异常");
                    }

                }

            }
        }catch (Exception e){
            e.printStackTrace();
            return new Result<>(false,"删除失败",null);
        }
        return new Result<>(false,"删除成功",null);
    }

    /**
     *
     * @Date 2018/1/19 16:00
     * @author students_ManagementSchool
     * @param map
     * @return
     * @since JDK 1.8
     * @condition 分页获取教学单元中的视频
     */
    @ResponseBody
    @RequestMapping(value = "/getVideosByUnit",method = RequestMethod.POST)
    public Result<PageResult<Video>> getOfficesByUnit(@RequestBody Map map){

        String unit_id=(String)map.get("unit_id");

        if (unit_id==null||unit_id.trim().isEmpty()){
            return new Result<>(false,"没有选中教学单元",null);
        }

        PageResult<Video> videoPageResult=new PageResult<>();

        int startPage=(int)map.get("iDisplayStart");
        int pageSize=(int)map.get("iDisplayLength");

        //获取总数
        int totalCount=unit_videoDao.getVideoCountByUnit(unit_id);
        if (totalCount==0){
            return null;
        }

        videoPageResult.setiTotalRecords(totalCount);
        videoPageResult.setiTotalDisplayRecords(totalCount);

        List<Video> videos=new ArrayList<>();
        String [] video_ids=unit_videoDao.getVideosByUnit(unit_id,startPage,pageSize);
        for (String video_id:video_ids){
            Video video=videoService.selectById(video_id);
            if (video==null){
                return new Result<>(false," gg  gg",null);
            }
            videos.add(video);
        }

        videoPageResult.setData(videos);
        return new Result<>(true,"获取成功",videoPageResult);
    }

}
