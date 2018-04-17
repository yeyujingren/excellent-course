package com.hfut.glxy.mapper;

import io.swagger.models.auth.In;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

/**
 * ProjectName: Courses <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2018/1/13 15:56 <br/>
 *
 * @author students_ManagementSchool
 * @since JDK 1.8
 */
@Mapper
@Component(value = "video_pictureDao")
public interface Video_PictureDao {

    /**   
         * 
         * @Date 2018/1/13 15:57
         * @author students_ManagementSchool
         * @param video_id
         * @return
         * @since JDK 1.8
         * @condition  获取视频的缩略图
    */
    @Select("select picture_id from video_picture where video_id=#{video_id} and isDelete=0")
    String getPictureByVideo(@Param("video_id") String video_id);

    /**
         *
         * @Date 2018/3/11 12:48
         * @author students_ManagementSchool
         * @param video_id
         * @return
         * @since JDK 1.8
         * @condition  删除视频截图
    */
    @Select("delete from video_picture where video_id=#{video_id}")
    Integer deleteRelation(@Param("video_id") String video_id);

    /**
         *
         * @Date 2018/3/29 22:32
         * @author students_ManagementSchool
         * @param video_id
         * @param picture_id
         * @return
         * @since JDK 1.8
         * @condition 增加视频图片
    */
    @Insert("insert into video_picture (video_id,picture_id,createtime,updatetime,isDelete)" +
            " values (#{video_id},#{picture_id},NOW(),NOW(),0)")
    Integer addRelation(@Param("video_id") String video_id,@Param("picture_id") String picture_id);

}
