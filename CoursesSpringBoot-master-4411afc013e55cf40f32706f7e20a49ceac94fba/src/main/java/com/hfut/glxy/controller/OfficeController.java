package com.hfut.glxy.controller;

import com.hfut.glxy.dto.PageResult;
import com.hfut.glxy.dto.Result;
import com.hfut.glxy.entity.Course;
import com.hfut.glxy.entity.Office;
import com.hfut.glxy.entity.Unit;
import com.hfut.glxy.mapper.Course_OfficeDao;
import com.hfut.glxy.mapper.OfficeDao;
import com.hfut.glxy.mapper.Unit_OfficeDao;
import com.hfut.glxy.service.OfficeService;
import com.sun.org.apache.regexp.internal.RE;
import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.TRANSACTION_MODE;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.nio.file.AccessDeniedException;
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
public class OfficeController {

    @Resource
    private OfficeService officeService;
    @Resource
    private Unit_OfficeDao unit_officeDao;
    @Resource
    private OfficeDao officeDao;
    @Resource
    private Course_OfficeDao course_officeDao;

    /**   
         * 
         * @Date 2018/1/19 13:07 
         * @author students_ManagementSchool
         * @param map
         * @return
         * @since JDK 1.8
         * @condition  删除office文件
    */
    @Transactional
    @ResponseBody
    @RequestMapping(value = "/deleteOfficeById",method = RequestMethod.POST)
    public Result<String> deleteOffice(@RequestBody Map map){

        String office_id=(String) map.get("office_id");
        String unit_id=(String) map.get("unit_id");

        /*System.out.println(unit_id);*/

        if (office_id==null||office_id.trim().isEmpty()){
            return new Result<>(false,"教学资料id不存在",null);
        }

        try{
            if (officeService.deleteById(Integer.parseInt(office_id))){

                if (unit_id==null){

                }else{
                    int deleteSuccess=unit_officeDao.deleteRelation(unit_id,office_id);
                    if (deleteSuccess!=1){
                        throw new RuntimeException("删除异常");
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
         * @condition
    */
    @ResponseBody
    @RequestMapping(value = "/getOfficesByUnit",method = RequestMethod.POST)
    public Result<PageResult<Office>> getOfficesByUnit(@RequestBody Map map){

        String unit_id=(String)map.get("unit_id");

        if (unit_id==null||unit_id.trim().isEmpty()){
            return new Result<>(false,"没有选中教学单元",null);
        }

        PageResult<Office> officePageResult=new PageResult<>();

        int startPage=(int)map.get("iDisplayStart");
        int pageSize=(int)map.get("iDisplayLength");

        //获取总数
        int totalCount=unit_officeDao.getOfficeCountByUnit(unit_id);
        if (totalCount==0){
            return null;
        }

        officePageResult.setiTotalRecords(totalCount);
        officePageResult.setiTotalDisplayRecords(totalCount);

        List<Office> offices=new ArrayList<>();
        String [] office_ids=unit_officeDao.getOfficesByUnit(unit_id,startPage,pageSize);
        for (String office_id:office_ids){
            Office office=officeService.selectById(office_id);
            if (office==null){
                return new Result<>(false," gg  gg",null);
            }
            offices.add(office);
        }

        officePageResult.setData(offices);
        return new Result<>(true,"获取成功",officePageResult);
    }

    /**
         *
         * @Date 2018/3/14 16:24
         * @author students_ManagementSchool
         * @param office
         * @return
         * @since JDK 1.8
         * @condition   更新资料描述
    */
    @ResponseBody
    @RequestMapping(value = "/updateOfficeDescription",method = RequestMethod.POST)
    public Result<Office> updateOfficeDescription(@RequestBody Office office){

        System.out.println("office.getId: "+office.getId());

        if (office.getId()==null){
            return new Result<>(false,"找不到文件",null);
        }
        if (office.getDescription()==null||office.getDescription().trim().isEmpty()){
            return new Result<>(false,"资料描述不能为空",null);
        }

        Integer success;

        try{
            success=officeDao.updateOfficeDescription(office);
        }catch (Exception e){
            return new Result<>(false,"更新出现问题，请重试",null);
        }

        if (success!=1){
            return new Result<>(false,"更新出现问题，请重试",null);
        }

        return new Result<>(true,"更新成功",null);
    }

    /**
         *
         * @Date 2018/3/14 17:36
         * @author students_ManagementSchool
         * @param course
         * @return
         * @since JDK 1.8
         * @condition  获取课程的教学资料
    */
    @ResponseBody
    @RequestMapping(value = "/getOfficesByCourse",method = RequestMethod.POST)
    public Result<List<Office>> getOfficeByCourse(@RequestBody Course course){

        String course_id=course.getId();

        if (course_id==null||course_id.trim().isEmpty()){
            return new Result<>(false,"该课程不存在",null);
        }

        List<Office> offices=new ArrayList<>();
        String [] office_ids=course_officeDao.getCourseInfosByCourse(course_id);
        for (String office_id:office_ids){
            Office office=officeService.selectById(office_id);
            if (office==null){
                return new Result<>(false,"获取失败",null);
            }
            offices.add(office);
        }

        return new Result<>(true,"获取成功",offices);
    }

/**
     *
     * @Date 2018/3/14 19:12
     * @author students_ManagementSchool
     * @param map
     * @return
     * @since JDK 1.8
     * @condition  删除课程资料
*/
    @Transactional
    @ResponseBody
    @RequestMapping(value = "/deleteCourseOfficeById",method = RequestMethod.POST)
    public Result<String> deleteCourseOfficeById(@RequestBody Map map){

        String office_id=(String) map.get("office_id");
        String course_id=(String) map.get("course_id");

        /*System.out.println(course_id);*/

        if (office_id==null||office_id.trim().isEmpty()){
            return new Result<>(false,"教学资料id不存在",null);
        }

        try{
            if (officeService.deleteById(Integer.parseInt(office_id))){

                if (course_id==null){

                }else{
                    int deleteSuccess=course_officeDao.deleteRelation(course_id,office_id);
                    if (deleteSuccess!=1){
                        throw new RuntimeException("删除异常");
                    }
                }

            }
        }catch (Exception e){
            e.printStackTrace();
            return new Result<>(false,"删除失败",null);
        }
        return new Result<>(false,"删除成功",null);
    }

}
