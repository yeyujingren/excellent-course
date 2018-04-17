package com.hfut.glxy.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

/**
 * ProjectName: Courses <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2018/1/7 12:11 <br/>
 *
 * @author students_ManagementSchool
 * @since JDK 1.8
 */
@Mapper
@Component(value = "/unit_videoDao")
public interface Unit_VideoDao {

    /**
         *
         * @Date 2018/1/7 12:15
         * @author students_ManagementSchool
         * @param unit_id
         * @return
         * @since JDK 1.8
         * @condition   获取教学单元的全部视频文件
    */
    @Select("select video_id from unit_video where unit_id=#{unit_id} and isDelete=0")
    String [] getVideosByUnitNoPage(@Param("unit_id") String unit_id);
    /**   
         * 
         * @Date 2018/3/11 9:50
         * @author students_ManagementSchool
         * @param unit_id
         * @param video_id
         * @return
         * @since JDK 1.8
         * @condition  删除视频和教学单元间的关系
    */
    @Delete("delete from unit_video where unit_id=#{unit_id} and video_id=#{video_id}")
    Integer deleteRelation(@Param("unit_id") String unit_id,@Param("video_id") String video_id);
    /**   
         * 
         * @Date 2018/3/11 9:52
         * @author students_ManagementSchool
         * @param unit_id
         * @param startPage
         * @param pageSize
         * @return
         * @since JDK 1.8
         * @condition  获取教学单元中的所有视频
    */
    @Select("select video_id from ( select video_id from unit_video where unit_id=#{unit_id})" +
            " as test limit #{startPage},#{pageSize}")
    String [] getVideosByUnit(@Param("unit_id") String unit_id,@Param("startPage") Integer startPage,
                               @Param("pageSize") Integer pageSize);
    /**
         *
         * @Date 2018/3/11 9:58
         * @author students_ManagementSchool
         * @param unit_id
         * @return
         * @since JDK 1.8
         * @condition  获取教学单元中视频的总数
    */
    @Select("select count(*) from unit_video where unit_id=#{unit_id} and isDelete=0")
    Integer getVideoCountByUnit(@Param("unit_id") String unit_id);

    /**
         *
         * @Date 2018/3/11 20:55
         * @author students_ManagementSchool
         * @param unit_id
         * @param video_id
         * @return
         * @since JDK 1.8
         * @condition
    */
    @Insert("insert into unit_video (unit_id,video_id,createtime,updatetime,isDelete)" +
            " values (#{unit_id},#{video_id},NOW(),NOW(),0)")
    Integer addRelation(@Param("unit_id") String unit_id,@Param("video_id") String video_id);
}
