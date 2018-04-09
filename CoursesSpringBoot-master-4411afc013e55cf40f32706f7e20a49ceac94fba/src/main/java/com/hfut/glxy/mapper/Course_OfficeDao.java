package com.hfut.glxy.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

/**
 * ProjectName: Courses <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2018/1/7 10:47 <br/>
 *
 * @author students_ManagementSchool
 * @since JDK 1.8
 */
@Mapper
@Component(value = "course_officeDao")
public interface Course_OfficeDao {

    /**
         *
         * @Date 2018/1/7 11:00
         * @author students_ManagementSchool
         * @param course_id
         * @return
         * @since JDK 1.8
         * @condition 获取某一课程的所有课程介绍：课程大纲、教学日历、考核方式与标准、学习指南
    */
    @Select("select office_id from course_office where course_id=#{course_id} and isDelete=0")
    String [] getCourseInfosByCourse(@Param("course_id") String course_id);

    /**   
         * 
         * @Date 2018/3/14 17:25
         * @author students_ManagementSchool
         * @param course_id
         * @param office_id
         * @return
         * @since JDK 1.8
         * @condition  绑定课程与教学资料
    */
    @Insert("insert into course_office (course_id,office_id,createtime,updatetime,isDelete)" +
            " values (#{course_id},#{office_id},NOW(),NOW(),0)")
    Integer addRelation(@Param("course_id") String course_id,@Param("office_id") String office_id);

    /**   
         * 
         * @Date 2018/3/14 19:11
         * @author students_ManagementSchool
         * @param office_id
         * @param course_id
         * @return
         * @since JDK 1.8
         * @condition  删除课程资料
    */
    @Delete("delete from course_office where course_id=#{course_id} and office_id=#{office_id}")
    Integer deleteRelation(@Param("course_id") String course_id,@Param("office_id") String office_id);

}
