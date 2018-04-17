/*
 * ProjectName: courses <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2017年11月21日 <br/>
 *
 * @author students_ManagementSchool
 * @version
 * @since JDK 1.8
 */

package com.hfut.glxy.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.sql.Timestamp;
@NoArgsConstructor
public class Video extends Model<Video> {

    @TableId(type = IdType.AUTO)
    private int id;
    private String chineseDescription;
    private String url;
    private Timestamp createTime;
    /*private Timestamp updateTime;*/
    private int isDelete;

    @Override
    public String toString() {
        return "Picture{" +
                "id='" + id + '\'' +
                ", chineseDescription='" + chineseDescription + '\'' +
                ", url='" + url + '\'' +
                ", createTime=" + createTime +
              /*  ", updateTime=" + updateTime +*/
                ", isDelete=" + isDelete +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getChineseDescription() {
        return chineseDescription;
    }

    public void setChineseDescription(String chineseDescription) {
        this.chineseDescription = chineseDescription;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

   /* public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }*/

    public int getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(int isDelete) {
        this.isDelete = isDelete;
    }

    @Override
    protected Serializable pkVal() {
        return id;
    }
}
