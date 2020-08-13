package org.jeecg.modules.facerecognition.quartz;

import com.alibaba.fastjson.JSONObject;
import org.jeecg.modules.facerecognition.util.EFaceUtil;
import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author 渣高帆
 * @Date 2020/8/13 20:56
 * @Version 1.0
 * 作用:定时任务
 **/
public class HelloJob implements Job {
  private static final SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  private JSONObject info;

  public JSONObject getInfo() {
    return info;
  }

  public void setInfo(JSONObject info) {
    this.info = info;
  }

  @Override
  public void execute(JobExecutionContext context) {
    Date now = new Date();
    String currentTime = sdf.format(now);
    System.out.println("执行时间为"+currentTime);
    JSONObject faceInfo = EFaceUtil.getInfo(EFaceUtil.getToken());
    if (null!=faceInfo){
      setInfo(faceInfo);
    }else{
      setInfo(null);
    }
  }

  public static void main(String[] args) {
    startTask();
  }
  /**
   * 定时任务
   */
  public static void startTask(){
    //创建jobDetail绑定HelloJob
    JobDetail jobDetail = JobBuilder.newJob(HelloJob.class)
      .withIdentity("myJob","myGroup").build();
    //创建触发器trigger每个5秒执行一次，一直执行
    Trigger trigger = TriggerBuilder.newTrigger().withIdentity("mtTrigger", "myGroup").startNow()
      .withSchedule(SimpleScheduleBuilder.simpleSchedule()
        .withIntervalInSeconds(5).repeatForever()).build();
    //创建调度者工厂
    SchedulerFactory schedulerFactory = new StdSchedulerFactory();
    try {
      //创建调度者
      Scheduler scheduler = schedulerFactory.getScheduler();
      //启动调度器
      scheduler.start();
      //设置调度任务
      scheduler.scheduleJob(jobDetail, trigger);
    } catch (SchedulerException e) {
      e.printStackTrace();
    }
  }
}
