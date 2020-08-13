package org.jeecg.modules.facerecognition.util;

import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Component;

import static org.jeecg.modules.facerecognition.util.HtppCommonUtil.sendPostUrl;

/**
 * @Author 渣高帆
 * @Date 2020/8/5 15:46
 * @Version 1.0
 * 作用:
 **/
@Component("eFaceUtil")
public class EFaceUtil {
  public static void main(String[] args) {

  }

  /**
   * 获取token
   * @return 返回一个token
   */
  public static String getToken(){
    String json =sendPostUrl("http://172.16.196.211:8085/cloudIntercom/login?", "userName=admin&password=admin", "UTF-8",null);
    JSONObject jsonObject= JSONObject.parseObject(json);
    return jsonObject.getString("token");
  }
  /**
   * 获取通行记录
   */
  public static JSONObject getInfo(String token){
    String json =sendPostUrl("http://172.16.196.211:8085/cloudIntercom/selectAccessRecord" +
      "?", "pageNum=1&pageSize=50", "UTF-8",token);
    JSONObject jsonObject= JSONObject.parseObject(json);
    return jsonObject;
  }
  /**
   * 查询部门树
   */
  public static JSONObject queryBranch(String token){
    String json =sendPostUrl("http://172.16.196.211:8085/cloudIntercom/selectDepartmentTree" +
      "?", "pageNum=1&pageSize=50", "UTF-8",token);
    JSONObject jsonObject= JSONObject.parseObject(json);
    return jsonObject;
  }
}
