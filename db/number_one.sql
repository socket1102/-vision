/*
 Navicat Premium Data Transfer

 Source Server         : mytom
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : number_one

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 31/07/2020 01:27:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for monitor_temperature
-- ----------------------------
DROP TABLE IF EXISTS `monitor_temperature`;
CREATE TABLE `monitor_temperature`  (
  `tp_id` int(11) NOT NULL COMMENT '主键，自增',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '关联用户表',
  `mt_data` date NULL DEFAULT NULL,
  `mt_time` time(0) NULL DEFAULT NULL,
  `mt_seat` int(11) NULL DEFAULT NULL COMMENT '摄像头位置（数据字典）',
  `mt_value` float(3, 2) NULL DEFAULT NULL COMMENT '7.5',
  `mt_unit` int(11) NULL DEFAULT NULL COMMENT '摄氏度/华氏度（数据字典）',
  `create_user` int(11) NULL DEFAULT NULL,
  `create_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`tp_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for monitor_temperature_item
-- ----------------------------
DROP TABLE IF EXISTS `monitor_temperature_item`;
CREATE TABLE `monitor_temperature_item`  (
  `mti_id` int(11) NULL DEFAULT NULL COMMENT '主键、自增',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '外键、用户表',
  `mti_mtid` int(11) NULL DEFAULT NULL COMMENT '体温登记表',
  `mti_value` float(3, 2) NULL DEFAULT NULL,
  `mti_time` time(0) NULL DEFAULT NULL,
  `mti_unit` int(11) NULL DEFAULT NULL COMMENT '摄氏/华氏',
  `mti_equipment` int(11) NULL DEFAULT NULL COMMENT '数据字典',
  `create_user` int(11) NULL DEFAULT NULL,
  `create_time` timestamp(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('MyScheduler', 'org.jeecg.modules.message.job.SendMsgJob', 'DEFAULT', NULL, 'org.jeecg.modules.message.job.SendMsgJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740009706172616D65746572707800);
INSERT INTO `qrtz_job_details` VALUES ('MyScheduler', 'org.jeecg.modules.quartz.job.SampleJob', 'DEFAULT', NULL, 'org.jeecg.modules.quartz.job.SampleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740009706172616D65746572707800);
INSERT INTO `qrtz_job_details` VALUES ('MyScheduler', 'org.jeecg.modules.quartz.job.SampleParamJob', 'DEFAULT', NULL, 'org.jeecg.modules.quartz.job.SampleParamJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740009706172616D6574657274000573636F74747800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('MyScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('MyScheduler', 'TRIGGER_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('MyScheduler', 'DESKTOP-VKPAU2H1596129716011', 1596130052471, 10000);

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 504832 kB; (`SCHED_NAME` `JOB_NAME` `JOB_GROUP`' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('MyScheduler', 'org.jeecg.modules.message.job.SendMsgJob', 'DEFAULT', 'org.jeecg.modules.message.job.SendMsgJob', 'DEFAULT', NULL, 1588405730000, 1588405680000, 5, 'PAUSED', 'CRON', 1588405284000, 0, NULL, 0, '');
INSERT INTO `qrtz_triggers` VALUES ('MyScheduler', 'org.jeecg.modules.quartz.job.SampleJob', 'DEFAULT', 'org.jeecg.modules.quartz.job.SampleJob', 'DEFAULT', NULL, 1588405730000, 1588405729000, 5, 'PAUSED', 'CRON', 1588405237000, 0, NULL, 0, '');
INSERT INTO `qrtz_triggers` VALUES ('MyScheduler', 'org.jeecg.modules.quartz.job.SampleParamJob', 'DEFAULT', 'org.jeecg.modules.quartz.job.SampleParamJob', 'DEFAULT', NULL, 1588405236000, 1588405235000, 5, 'PAUSED', 'CRON', 1588405221000, 0, NULL, 0, '');

-- ----------------------------
-- Table structure for sys_announcement
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement`;
CREATE TABLE `sys_announcement`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `titile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `msg_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `sender` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布人',
  `priority` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优先级（L低，M中，H高）',
  `msg_category` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2' COMMENT '消息类型1:通知公告2:系统消息',
  `msg_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通告对象类型（USER:指定用户，ALL:全体用户）',
  `send_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布状态（0未发布，1已发布，2已撤销）',
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `cancel_time` datetime(0) NULL DEFAULT NULL COMMENT '撤销时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除状态（0，正常，1已删除）',
  `bus_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型(email:邮件 bpm:流程)',
  `bus_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务id',
  `open_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打开方式(组件：component 路由：url)',
  `open_page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件/路由 地址',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '指定用户',
  `msg_abstract` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '摘要',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统通告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_announcement
-- ----------------------------
INSERT INTO `sys_announcement` VALUES ('1256486502931722242', 'JeecgBoot 2.2.0版本发布', '<h5 id=\"h5_5\" style=\"box-sizing: inherit; font-family: \'PingFang SC\', \'Helvetica Neue\', \'Microsoft YaHei UI\', \'Microsoft YaHei\', \'Noto Sans CJK SC\', Sathu, EucrosiaUPC, Arial, Helvetica, sans-serif; line-height: 1.8; margin: 22px 0px 16px; padding: 0px; font-size: 18px; border: none; color: #333333; background-color: #ffffff;\">升级不兼容</h5>\n<ul style=\"box-sizing: inherit; margin: 0px 0px 20px; padding: 0px 0px 0px 20px; color: #333333; font-family: -apple-system, BlinkMacSystemFont, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;\">\n<li style=\"box-sizing: inherit; line-height: 1.875em; margin-top: 0px;\">1、升级 ant-design-vue 到最新版本 1.5.2，会导致使用disabled的组件不可用（需要全局替换disabled 为readOnly；另外原来readOnly不允许全小写）</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">2、JSearchSelectTag.vue行编辑的popup传参做了修改，需要全局替换 orgFieldse 为 orgFields</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">3、 项目删除了sass，全部换成 less，其中涉及/deep/语法得改造</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em; margin-bottom: 0px;\">4、 Online表单的填值规则用法修改了&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" href=\"http://doc.jeecg.com/1630378\">文档</a></li>\n</ul>\n<h5 id=\"h5_6\" style=\"box-sizing: inherit; font-family: \'PingFang SC\', \'Helvetica Neue\', \'Microsoft YaHei UI\', \'Microsoft YaHei\', \'Noto Sans CJK SC\', Sathu, EucrosiaUPC, Arial, Helvetica, sans-serif; line-height: 1.8; margin: 22px 0px 16px; padding: 0px; font-size: 18px; border: none; color: #333333; background-color: #ffffff;\">较大改造</h5>\n<ul style=\"box-sizing: inherit; margin: 0px 0px 20px; padding: 0px 0px 0px 20px; color: #333333; font-family: -apple-system, BlinkMacSystemFont, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;\">\n<li style=\"box-sizing: inherit; line-height: 1.875em; margin-top: 0px;\">登录的时候一次性加载系统字典，进行前端缓存，减少ajax重复请求</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">修改定时任务quartz配置</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">logback-spring.xml配置不按照日期和大小生成新日志文件问题修复</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">vue-cli3 编译打包进行zip压缩优化</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">根据index.html页面window._CONFIG[\'domianURL\']，指定 axios的 baseURL（所以vue的代理没有用了）</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">JEditableTable重构，新增获取值时应该把临时id去掉、行编辑修改不直接更改数据源的ID</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em; margin-bottom: 0px;\">Online模块重点优化升级、Online代码生成器重点优化升级</li>\n</ul>\n<h5 id=\"h5_7\" style=\"box-sizing: inherit; font-family: \'PingFang SC\', \'Helvetica Neue\', \'Microsoft YaHei UI\', \'Microsoft YaHei\', \'Noto Sans CJK SC\', Sathu, EucrosiaUPC, Arial, Helvetica, sans-serif; line-height: 1.8; margin: 22px 0px 16px; padding: 0px; font-size: 18px; border: none; color: #333333; background-color: #ffffff;\">ONLINE升级</h5>\n<ul style=\"box-sizing: inherit; margin: 0px 0px 20px; padding: 0px 0px 0px 20px; color: #333333; font-family: -apple-system, BlinkMacSystemFont, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;\">\n<li style=\"box-sizing: inherit; line-height: 1.875em; margin-top: 0px;\">Online访问权限控制实现，如果online表单配置了菜单，则用户需要授权才能访问此表单</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online表单新增组件： 省市区地域组件、开关组件、三级联动(级联下拉)组件、markdown组件</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online表单弹窗宽度，根据不同的列数显示不同的宽度，实现更好的效果</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online 树表单功能一系列优化，比如数据列新增添加下级按钮功能、添加下级不自动展开列表等问题</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online JS增强编辑器支持放大，同时JS代码变更，增加版本记忆功能，方便追踪历史</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online JS增强支持lodash工具</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online控件 默认值表达式功能&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" href=\"http://doc.jeecg.com/1630378\">文档</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online 增加Excel导入导出转换器配置，针对各种控件的导入导出做了统一处理</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online 列表字段排序支持配置</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online同步数据库，数据库兼容性优化（mysql、oracle11g、SqlServer2017）</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online功能列表，高级查询优化，丰富控件的支持（新增：用户选择、部门选择、时间等）</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online表单配置，类型Text、date、Blob的字段长度默认设置为0</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online自定义button，支持位置自定义（支持右侧和下方）</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online表单列表，列表显示那些字段，支持用户个性化设置</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online表单删除和移除逻辑优化，防止未同步情况下删除报错</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online上传逻辑重构，针对单表、一对多行操作，都支持图片和文件上传，同时支持三种模式（minio、阿里云、本地存储）</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online上传逻辑重构， 行编辑模式，支持图片顺序修改</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online上传逻辑重构，在列表页面支持图片和文件的展示</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online表单索引同步逻辑重构，同时支持选择多个字段，组合索引设置</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online表单 excel导出实现数据权限逻辑</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online表单列表强制列不换行，自动出现超出滚定条，支持移动端自适应（单表、树和ERP等模型都已修改）</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online表单管理列表，回车查询和列表左右拖动移动自适应问题</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online表单附表序号必填</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online表名加校验不能全是数字，自动trim空格</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online 一对多tab必填校验不通过，添加友好提醒</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online表单控件默认值示例</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online一对多内嵌子表风格，高级查询不好用，过滤不了数据处理</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online表单 自定义校验规则正则，录入不成功问题处理</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online表单设置不分页，排序后又分页了问题处理</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online表单，下拉搜索组件，表字典配置加条件，下拉值出不来问题处理</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online表单，一对一子表，下拉选择、时间等组件被遮挡问题处理</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online表单树模型和一对多ERP模板支持href</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online 报表支持上下文变量表达式</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online 报表实现数据权限逻辑</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online 报表新增拖动字段顺序</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online 报表列表，sql过长截取显示</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">Online 报表，popup回车查询</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em; margin-bottom: 0px;\">Online表单auto页面弹窗改成JModule；online表单移动自适应；</li>\n</ul>\n<h5 id=\"h5_8\" style=\"box-sizing: inherit; font-family: \'PingFang SC\', \'Helvetica Neue\', \'Microsoft YaHei UI\', \'Microsoft YaHei\', \'Noto Sans CJK SC\', Sathu, EucrosiaUPC, Arial, Helvetica, sans-serif; line-height: 1.8; margin: 22px 0px 16px; padding: 0px; font-size: 18px; border: none; color: #333333; background-color: #ffffff;\">Online代码生成器升级</h5>\n<blockquote style=\"box-sizing: inherit; position: relative; margin: 0px 0px 20px; padding: 20px; background-color: #f6f6f6; border-left: 6px solid #e6e6e6; word-break: break-word; color: #333333; font-family: -apple-system, BlinkMacSystemFont, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 16px;\">\n<p style=\"box-sizing: inherit; margin: 0px; line-height: inherit;\">后期重点维护ONLINE模式的代码生成器，GUI模式逐步弃用。</p>\n</blockquote>\n<ul style=\"box-sizing: inherit; margin: 0px 0px 20px; padding: 0px 0px 0px 20px; color: #333333; font-family: -apple-system, BlinkMacSystemFont, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;\">\n<li style=\"box-sizing: inherit; line-height: 1.875em; margin-top: 0px;\">新增内嵌Table代码生成器模板</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">升级代码生成器依赖，支持返回生成结果&amp;支持服务器端生成代码config</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">代码生成器列表，列表自适应优化，支持移动效果（强制列不换行，不过有弊端，<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" href=\"http://doc.jeecg.com/1607183\">见文档</a>）</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">实体生成，自动带着swagger 注解（支持单表、一对多等模型）</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">代码生成器，列表移动自适应样式修改</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">生成后的代码导入导出bug修复</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">online树代码生成器模板，直接删除一级分类会导致列表乱</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">ERP代码生成器模板升级，子表支持导入导出</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">ERP风格代码生成器模板问题（导入导入路径错误、swagger注解问题）</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">代码生成器，校验为空的话不生成，简化生成的代码</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">代码生成器，支持子表校验生成</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">树形列表代码生成器优化，添加子节点</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">修复bug： online字典未配置，代码生成器报错问题</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">生成的实体字段excel注解，针对系统标准字段，创建人、创建时间等字段不生成</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">生成的表单弹窗统一更换为j-modal，支持放大缩小全屏</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">代码生成，popup参数大小写 驼峰问题修复</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">生成的表单控件类型更丰富，新支持控件：markdown、省市区地域、密码、下拉搜索</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em; margin-bottom: 0px;\">生成的列表查询区域，控件支持加强，新支持控件：省市区地域、下拉搜索、popup、选择用户、选择部门</li>\n</ul>\n<h5 id=\"h5_9\" style=\"box-sizing: inherit; font-family: \'PingFang SC\', \'Helvetica Neue\', \'Microsoft YaHei UI\', \'Microsoft YaHei\', \'Noto Sans CJK SC\', Sathu, EucrosiaUPC, Arial, Helvetica, sans-serif; line-height: 1.8; margin: 22px 0px 16px; padding: 0px; font-size: 18px; border: none; color: #333333; background-color: #ffffff;\">平台基础升级</h5>\n<ul style=\"box-sizing: inherit; margin: 0px 0px 20px; padding: 0px 0px 0px 20px; color: #333333; font-family: -apple-system, BlinkMacSystemFont, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;\">\n<li style=\"box-sizing: inherit; line-height: 1.875em; margin-top: 0px;\">针对auto隐藏路由菜单，实现自动授权，简化online菜单的授权</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">IDE中找不到sun.misc.BASE64Encoder jar包问题</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">删掉作废获取所有用户角色列表接口，接口有性能问题</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">在我的消息里点击已读以后，首页上面的通知红点并没有同步更改问题修复</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">用户与部门取消关联删除关联关系bug修改</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">部门导入未刷新redis缓存</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">修复SysPermissionMapper.xml 的SQL语句不兼容SQLServer的问题</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">在线动态数据源代码重构</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">【二级管理员】部门修改、删除权限时关联删除部门角色数据</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">【二级管理员】我的部门，选中部门只能看当前部门下的角色</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">我的消息支持模糊查询</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">常用示例-对象存储文件上传优化</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">用户相关功能，sql写法不兼容其他数据库问题修复</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">图片上传组件修改</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">导入功能优化，提示准确导入成功失败信息，涉及功能 用户、角色、部门、字典、定时任务等</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">增加生产环境禁用swagger-ui配置</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">第三方登录代码集成</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">系统公告优化</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">MockController 返回json数据，utf-8格式化，防止中文乱码</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">部门删除后删除部门角色等关联</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em; margin-bottom: 0px;\">分类字典支持选择数据，添加下级分类</li>\n</ul>\n<h5 id=\"h5_10\" style=\"box-sizing: inherit; font-family: \'PingFang SC\', \'Helvetica Neue\', \'Microsoft YaHei UI\', \'Microsoft YaHei\', \'Noto Sans CJK SC\', Sathu, EucrosiaUPC, Arial, Helvetica, sans-serif; line-height: 1.8; margin: 22px 0px 16px; padding: 0px; font-size: 18px; border: none; color: #333333; background-color: #ffffff;\">UI组件升级</h5>\n<ul style=\"box-sizing: inherit; margin: 0px 0px 20px; padding: 0px 0px 0px 20px; color: #333333; font-family: -apple-system, BlinkMacSystemFont, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;\">\n<li style=\"box-sizing: inherit; line-height: 1.875em; margin-top: 0px;\">升级 ant-design-vue 为最新版本 1.5.2</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">登录验证码获取失败的时候，不显示空白</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">升级 ant-design-vue，JModal切换全屏按钮因ant升级错位问题修复</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">简化 j-modal 的相关代码</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">封装常用组件示例；JInput新增当 type 变化的时候重新计算值</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">markdown集成</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">富文本支持minio上传</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">选择用户组件列表样式错位；Ellipsis.vue 优化</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">JModal移动端全屏效果</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">高级查询只有在 in 模式下才能多选</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">自定义选择用户组件JSelectMultiUser的宽度和截取显示长度</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">行编辑 JEditableTable移动自适应效果；</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">JEditableTable重构 行编辑新增合计功能</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">JEditableTable重构 行编辑Popup请求数量过多（加缓存机制）</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">JEditableTable重构,行编辑InputNumber扩展支持输入小数和负数</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">JEditableTable.vue disable模式禁用添加删除按钮</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">JEditableTable行编辑， popup返回值，时间赋值有问题</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">JEditableTable行编辑，日期控件显示错位问题</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">高级查询移动自适应效果；</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">高级查询保存的同时也要保存匹配方式（支持and or）</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">高级查询混入统一修改</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">高级查询选择用户组件时，点开用户弹框不选择用户，直接关掉用户弹框，再次点击弹框时，无法点开问题</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">高级查询组件支持，新支持组件，选择人、选择部门、popup、时间等</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">JPopup支持多选</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">JPopup返回值null问题</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">JPopup列表数据不刷新问题</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">JSearchSelectTag.vue匹配不上数字值问题</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">JSelectUserByDep 根据部门选择人组件bug</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">JTreeDict.vue 分类字典组件 清空不了问题</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">常用示例，新增搜索下拉 JSearchSelectTag.vue例子</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">常用示例，新增如何关闭当前页面例子</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">常用示例，省市区三级联动的例子</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">常用示例，增加字典下拉多选组件示例</li>\n<li style=\"box-sizing: inherit; line-height: 1.875em; margin-bottom: 0px;\">示例demo，关于图片的做统一优化</li>\n</ul>\n<h5 id=\"h5_11\" style=\"box-sizing: inherit; font-family: \'PingFang SC\', \'Helvetica Neue\', \'Microsoft YaHei UI\', \'Microsoft YaHei\', \'Noto Sans CJK SC\', Sathu, EucrosiaUPC, Arial, Helvetica, sans-serif; line-height: 1.8; margin: 22px 0px 16px; padding: 0px; font-size: 18px; border: none; color: #333333; background-color: #ffffff;\">Issues处理</h5>\n<ul style=\"box-sizing: inherit; margin: 0px 0px 20px; padding: 0px 0px 0px 20px; color: #333333; font-family: -apple-system, BlinkMacSystemFont, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;\">\n<li style=\"box-sizing: inherit; line-height: 1.875em; margin-top: 0px;\">online form表单项能否支持配置有级联关系的内容&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#948\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/948\">#948</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">全局拦截异常错误的提醒文字&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#768\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/768\">#768</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">建议：城市级联选择组件&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#905\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/905\">#905</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">表单配置中检验字段配置href，报表中该配置字段无法看到链接&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#961\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/961\">#961</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">SysUserMapper.xml查询脚本数据兼容问题&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#962\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/962\">#962</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">在线表单 提示 ButtonExpHandler is not defined&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#957\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/957\">#957</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">online表单中添加自定义按钮无法显示&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#973\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/973\">#973</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">online报表不支持按照登录用户过滤数据&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#934\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/934\">#934</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">点击新增或者编辑按钮弹框宽度的设置问题&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#974\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/974\">#974</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">online报表配置中使用系统参数，报错&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"I1AWNM\" href=\"https://gitee.com/jeecg/jeecg-boot/issues/I1AWNM\">I1AWNM</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">online增强SQL变量取数为null,#{sys.sys_date} 还有#{sys.sys_time}&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#999\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/999\">#999</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">一个主表，多个付表。1对多。保存后，某些从表行项目内容保存成功，单重新打开数据表现丢失。&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#997\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/997\">#997</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">/online/cgform/api/exportXls/{code}接口问题&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#1012\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/1012\">#1012</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">打成jar包，访问不到代码生成器模板&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#1010\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/1010\">#1010</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">online表单开发，打包后模板找不到&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#865\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/865\">#865</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">已生成的代码，子表最下下行添加合计行底部固定问题&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#936\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/936\">#936</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">下拉搜索框在编辑时下拉name无法带过来&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#971\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/971\">#971</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">建议autoPoi升级，优化数据返回List Map格式下的复合表头导出excel的体验&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#873\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/873\">#873</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">配置 Href 跳转，并没有显示为超链接&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#1020\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/1020\">#1020</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">首次打开一对多表单，JEditableTable的addDefaultRowNum属性不生效&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#1003\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/1003\">#1003</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">autopoi 双表头问题&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#862\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/862\">#862</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">应该是权限管理bug&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#110\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/110\">#110</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">在线 的online报表报错&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#1029\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/1029\">#1029</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">online代码生成器树形表单父节点字段名称问题&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"issues/I1ABGV \" href=\"https://gitee.com/jeecg/jeecg-boot/issues/I1ABGV\">issues/I1ABGV</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">点击j-popup,里面有数据，如果选择同名的数据，文本框为空&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#1044\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/1044\">#1044</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">关于table列宽可拖动问题&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#1054\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/1054\">#1054</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">单表数据导出多表头 auto 的Excel注解 groupName属性<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\" #1053\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/1053\">&nbsp;#1053</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">在线报表和在线online的问题&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#1030\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/1030\">#1030</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">J-pop组件&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#1043\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/1043\">#1043</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">2.1.4 日志管理---没有记录查询接口参数&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#1070\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/1070\">#1070</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">服务器日志超过设置的MaxFileSize时&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#1130\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/1130\">#1130</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">online 表单中，在 附表中存在上传图片组件，点击上传图片并提交，显示提交失败&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#1074\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/1074\">#1074</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">online表单js增强修改从表控件值问题&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#1051\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/1051\">#1051</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">重复代理问题&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#994\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/994\">#994</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">系统使用的日志包有问题&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#887\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/887\">#887</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">使用sqlserver数据库,用户管理查询出错&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#1140\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/1140\">#1140</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">主表和从表 一对一关系表单 TypeError: Cannot read property \'getAll\' of undefined&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"#1129\" href=\"https://github.com/zhangdaiscott/jeecg-boot/issues/1129\">#1129</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">ERP表单附表数据编辑后消失&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"issues/I1DN3B\" href=\"https://gitee.com/jeecg/jeecg-boot/issues/I1DN3B\">issues/I1DN3B</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">多表的erp模式生成的子表，表单没有导入导出功能&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"issues/I1BB2U\" href=\"https://gitee.com/jeecg/jeecg-boot/issues/I1BB2U\">issues/I1BB2U</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">用edge打开首页，整个页面动不了，控制台console打出很多错误&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"issues/I189B5\" href=\"https://gitee.com/jeecg/jeecg-boot/issues/I189B5\">issues/I189B5</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">官方的快速开发平台主子表对IE11不兼容&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"issues/I17LEE\" href=\"https://gitee.com/jeecg/jeecg-boot/issues/I17LEE\">issues/I17LEE</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em;\">360兼容模式 修改为你说的js之后；单表的数据兼容可以；主子表的不加载；错误如下&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"issues/I17H8L\" href=\"https://gitee.com/jeecg/jeecg-boot/issues/I17H8L\">issues/I17H8L</a></li>\n<li style=\"box-sizing: inherit; line-height: 1.875em; margin-bottom: 0px;\">Online表单开发，点击&ldquo;新增&rdquo;按钮，是否树：选择是，页面控制台报错&nbsp;<a style=\"box-sizing: inherit; background-color: transparent; color: #4183c4; text-decoration-line: none;\" title=\"issues/I1BHXG\" href=\"https://gitee.com/jeecg/jeecg-boot/issues/I1BHXG\">issues/I1BHXG</a></li>\n</ul>', '2020-05-01 15:30:56', '2020-05-30 15:31:00', 'admin', 'H', '1', 'ALL', '1', '2020-05-02 15:31:44', NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2020-05-02 15:31:41', 'admin', '2020-05-02 15:31:44', NULL, '重磅版本发布');
INSERT INTO `sys_announcement` VALUES ('1256486817286418434', '放假通知', '<p>放假通知</p>', '2020-05-02 15:32:38', '2020-05-30 15:32:40', 'admin', 'M', '1', 'USER', '1', '2020-05-02 15:32:59', NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2020-05-02 15:32:56', 'admin', '2020-05-02 15:32:59', 'e9ca23d68d884d4ebb19d07889727dae,a75d45a015c44384a04449ee80dc3503,', '放假通知');
INSERT INTO `sys_announcement` VALUES ('1256529336858685441', '1', '<p>22</p>', '2020-05-02 18:21:41', '2020-05-30 18:21:44', 'admin', 'M', '1', 'ALL', '2', '2020-05-02 18:21:57', '2020-05-02 18:22:07', '0', NULL, NULL, NULL, NULL, 'admin', '2020-05-02 18:21:54', 'admin', '2020-05-02 18:22:07', NULL, '22');
INSERT INTO `sys_announcement` VALUES ('1b714f8ebc3cc33f8b4f906103b6a18d', '5467567', NULL, NULL, NULL, 'admin', NULL, '2', NULL, '1', '2019-03-30 12:40:38', NULL, '1', NULL, NULL, NULL, NULL, 'admin', '2019-02-26 17:23:26', 'admin', '2020-05-02 15:30:42', NULL, NULL);
INSERT INTO `sys_announcement` VALUES ('3d11237ccdf62450d20bb8abdb331178', '111222', NULL, NULL, NULL, NULL, NULL, '2', NULL, '0', NULL, NULL, '1', NULL, NULL, NULL, NULL, 'admin', '2019-03-29 17:19:47', 'admin', '2019-03-29 17:19:50', NULL, NULL);
INSERT INTO `sys_announcement` VALUES ('7ef04e95f8de030b1d5f7a9144090dc6', '111', NULL, '2019-02-06 17:28:10', '2019-03-08 17:28:11', NULL, NULL, '2', NULL, '0', NULL, NULL, '1', NULL, NULL, NULL, NULL, 'admin', '2019-02-26 17:28:17', 'admin', '2019-03-26 19:59:49', NULL, NULL);
INSERT INTO `sys_announcement` VALUES ('93a9060a1c20e4bf98b3f768a02c2ff9', '111', '111', '2019-02-06 17:20:17', '2019-02-21 17:20:20', 'admin', 'M', '2', 'ALL', '1', '2019-02-26 17:24:29', NULL, '1', NULL, NULL, NULL, NULL, 'admin', '2019-02-26 17:16:26', 'admin', '2020-05-02 15:30:42', NULL, NULL);
INSERT INTO `sys_announcement` VALUES ('de1dc57f31037079e1e55c8347fe6ef7', '222', '2222', '2019-02-06 17:28:26', '2019-02-23 17:28:28', 'admin', 'M', '2', 'ALL', '1', '2019-03-29 17:19:56', NULL, '1', NULL, NULL, NULL, NULL, 'admin', '2019-02-26 17:28:36', 'admin', '2019-02-26 17:28:40', NULL, NULL);
INSERT INTO `sys_announcement` VALUES ('e52f3eb6215f139cb2224c52517af3bd', '334', '334', NULL, NULL, NULL, NULL, '2', NULL, '0', NULL, NULL, '1', NULL, NULL, NULL, NULL, 'admin', '2019-03-30 12:40:28', 'admin', '2019-03-30 12:40:32', NULL, NULL);

-- ----------------------------
-- Table structure for sys_announcement_send
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement_send`;
CREATE TABLE `sys_announcement_send`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annt_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通告ID',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `read_flag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阅读状态（0未读，1已读）',
  `read_time` datetime(0) NULL DEFAULT NULL COMMENT '阅读时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户通告阅读标记表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_announcement_send
-- ----------------------------
INSERT INTO `sys_announcement_send` VALUES ('646c0c405ec643d4dc4160db2446f8ff', '93a9060a1c20e4bf98b3f768a02c2ff9', 'e9ca23d68d884d4ebb19d07889727dae', '1', '2019-11-21 16:30:01', 'admin', '2019-05-17 11:50:56', 'admin', '2019-11-21 16:30:01');
INSERT INTO `sys_announcement_send` VALUES ('1197434450981543938', '93a9060a1c20e4bf98b3f768a02c2ff9', 'a75d45a015c44384a04449ee80dc3503', '0', NULL, 'jeecg', '2019-11-21 16:39:55', NULL, NULL);
INSERT INTO `sys_announcement_send` VALUES ('1256486817319972866', '1256486817286418434', 'e9ca23d68d884d4ebb19d07889727dae', '1', '2020-05-02 15:33:05', 'admin', '2020-05-02 15:32:56', 'admin', '2020-05-02 15:33:05');
INSERT INTO `sys_announcement_send` VALUES ('1256486817349332993', '1256486817286418434', 'a75d45a015c44384a04449ee80dc3503', '0', '2020-05-02 15:32:56', 'admin', '2020-05-02 15:32:56', NULL, NULL);
INSERT INTO `sys_announcement_send` VALUES ('1256527099214278657', '1256486502931722242', 'e9ca23d68d884d4ebb19d07889727dae', '1', '2020-05-02 18:22:00', 'admin', '2020-05-02 18:12:59', 'admin', '2020-05-02 18:22:00');

-- ----------------------------
-- Table structure for sys_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE `sys_category`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级节点',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型编码',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  `has_child` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有子节点',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_category
-- ----------------------------
INSERT INTO `sys_category` VALUES ('1183693424827564034', '0', '物料树', 'B02', 'admin', '2019-10-14 18:37:59', 'admin', '2019-10-14 18:38:15', 'A01', '1');
INSERT INTO `sys_category` VALUES ('1183693491043041282', '1183693424827564034', '上衣', 'B02A01', 'admin', '2019-10-14 18:38:15', 'admin', '2019-10-14 18:38:43', 'A01', '1');
INSERT INTO `sys_category` VALUES ('1183693534173069314', '1183693424827564034', '裤子', 'B02A02', 'admin', '2019-10-14 18:38:25', NULL, NULL, 'A01', NULL);
INSERT INTO `sys_category` VALUES ('1183693610534567937', '1183693491043041282', '秋衣', 'B02A01A01', 'admin', '2019-10-14 18:38:43', NULL, NULL, 'A01', NULL);
INSERT INTO `sys_category` VALUES ('1183693700254924802', '1183693491043041282', '兵装', 'B02A01A02', 'admin', '2019-10-14 18:39:05', NULL, NULL, 'A01', NULL);
INSERT INTO `sys_category` VALUES ('1183693773974011906', '1183693491043041282', '女装', 'B02A01A03', 'admin', '2019-10-14 18:39:22', NULL, NULL, 'A01', NULL);
INSERT INTO `sys_category` VALUES ('1185039122143719425', '0', '电脑产品', 'A01', 'admin', '2019-10-18 11:45:18', 'admin', '2019-10-18 11:45:31', 'A01', '1');
INSERT INTO `sys_category` VALUES ('1185039176799694850', '1185039122143719425', 'thinkpad', 'A01A01', 'admin', '2019-10-18 11:45:31', NULL, NULL, 'A01', NULL);
INSERT INTO `sys_category` VALUES ('1185039255115739138', '1185039122143719425', 'mackbook', 'A01A02', 'admin', '2019-10-18 11:45:50', NULL, NULL, 'A01', NULL);
INSERT INTO `sys_category` VALUES ('1185039299051073537', '1185039122143719425', '华为电脑', 'A01A03', 'admin', '2019-10-18 11:46:01', NULL, NULL, 'A01', NULL);
INSERT INTO `sys_category` VALUES ('1230769196661510146', '0', '省', NULL, 'admin', '2020-02-21 16:20:16', 'admin', '2020-02-21 16:20:31', 'A01A03', '1');
INSERT INTO `sys_category` VALUES ('1230769253267836929', '1230769196661510146', '安徽省', NULL, 'admin', '2020-02-21 16:20:31', 'admin', '2020-02-21 16:20:53', 'A01A03', '1');
INSERT INTO `sys_category` VALUES ('1230769290609725441', '1230769196661510146', '山东省', NULL, 'admin', '2020-02-21 16:20:40', 'admin', '2020-02-21 16:21:23', 'A01A03', '1');
INSERT INTO `sys_category` VALUES ('1230769347157331969', '1230769253267836929', '合肥市', NULL, 'admin', '2020-02-21 16:20:53', 'admin', '2020-02-21 16:21:08', 'A01A03', '1');
INSERT INTO `sys_category` VALUES ('1230769407907631106', '1230769347157331969', '包河区', NULL, 'admin', '2020-02-21 16:21:08', NULL, NULL, 'A01A03', NULL);
INSERT INTO `sys_category` VALUES ('1230769470889299970', '1230769290609725441', '济南市', NULL, 'admin', '2020-02-21 16:21:23', 'admin', '2020-02-21 16:21:41', 'A01A03', '1');
INSERT INTO `sys_category` VALUES ('1230769547519234050', '1230769470889299970', 'A区', NULL, 'admin', '2020-02-21 16:21:41', NULL, NULL, 'A01A03', NULL);
INSERT INTO `sys_category` VALUES ('1230769620021972993', '1230769470889299970', 'B区', NULL, 'admin', '2020-02-21 16:21:58', NULL, NULL, 'A01A03', NULL);
INSERT INTO `sys_category` VALUES ('1230769769930592257', '1230769253267836929', '淮南市', NULL, 'admin', '2020-02-21 16:22:34', 'admin', '2020-02-21 16:22:54', 'A01A03', '1');
INSERT INTO `sys_category` VALUES ('1230769855347593217', '1230769769930592257', 'C区', NULL, 'admin', '2020-02-21 16:22:54', NULL, NULL, 'A01A03', NULL);
INSERT INTO `sys_category` VALUES ('22a50b413c5e1ef661fb8aea9469cf52', 'e9ded10fd33e5753face506f4f1564b5', 'MacBook', 'B01-2-1', 'admin', '2019-06-10 15:43:13', NULL, NULL, 'A01', NULL);
INSERT INTO `sys_category` VALUES ('5c8f68845e57f68ab93a2c8d82d26ae1', '0', '笔记本', 'B01', 'admin', '2019-06-10 15:34:11', 'admin', '2019-06-10 15:34:24', 'A01', '1');
INSERT INTO `sys_category` VALUES ('937fd2e9aa13b8bab1da1ca36d3fd344', 'e9ded10fd33e5753face506f4f1564b5', '台式机', 'B02-2-2', 'admin', '2019-06-10 15:43:32', 'admin', '2019-08-21 12:01:59', 'A01', NULL);
INSERT INTO `sys_category` VALUES ('e9ded10fd33e5753face506f4f1564b5', '5c8f68845e57f68ab93a2c8d82d26ae1', '苹果电脑', 'B01-2', 'admin', '2019-06-10 15:41:14', 'admin', '2019-06-10 15:43:13', 'A01', '1');
INSERT INTO `sys_category` VALUES ('f39a06bf9f390ba4a53d11bc4e0018d7', '5c8f68845e57f68ab93a2c8d82d26ae1', '华为', 'B01-1', 'admin', '2019-06-10 15:34:24', 'admin', '2019-08-21 12:01:56', 'A01', NULL);

-- ----------------------------
-- Table structure for sys_check_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_check_rule`;
CREATE TABLE `sys_check_rule`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `rule_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `rule_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则Code',
  `rule_json` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则JSON',
  `rule_description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则描述',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_sys_check_rule_code`(`rule_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_check_rule
-- ----------------------------
INSERT INTO `sys_check_rule` VALUES ('1224980593992388610', '通用编码规则', 'common', '[{\"digits\":\"1\",\"pattern\":\"^[a-z|A-Z]$\",\"message\":\"第一位只能是字母\"},{\"digits\":\"*\",\"pattern\":\"^[0-9|a-z|A-Z|_]{0,}$\",\"message\":\"只能填写数字、大小写字母、下划线\"},{\"digits\":\"*\",\"pattern\":\"^.{3,}$\",\"message\":\"最少输入3位数\"},{\"digits\":\"*\",\"pattern\":\"^.{3,12}$\",\"message\":\"最多输入12位数\"}]', '规则：1、首位只能是字母；2、只能填写数字、大小写字母、下划线；3、最少3位数，最多12位数。', 'admin', '2020-02-07 11:25:48', 'admin', '2020-02-05 16:58:27');
INSERT INTO `sys_check_rule` VALUES ('1225001845524004866', '负责的功能测试', 'test', '[{\"digits\":\"*\",\"pattern\":\"^.{3,12}$\",\"message\":\"只能输入3-12位字符\"},{\"digits\":\"3\",\"pattern\":\"^\\\\d{3}$\",\"message\":\"前3位必须是数字\"},{\"digits\":\"*\",\"pattern\":\"^[^pP]*$\",\"message\":\"不能输入P\"},{\"digits\":\"4\",\"pattern\":\"^@{4}$\",\"message\":\"第4-7位必须都为 @\"},{\"digits\":\"2\",\"pattern\":\"^#=$\",\"message\":\"第8-9位必须是 #=\"},{\"digits\":\"1\",\"pattern\":\"^O$\",\"message\":\"第10位必须为大写的O\"},{\"digits\":\"*\",\"pattern\":\"^.*。$\",\"message\":\"必须以。结尾\"}]', '包含长度校验、特殊字符校验等', 'admin', '2020-02-07 11:57:31', 'admin', '2020-02-05 18:22:54');

-- ----------------------------
-- Table structure for sys_data_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_log`;
CREATE TABLE `sys_data_log`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `data_table` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `data_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据ID',
  `data_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据内容',
  `data_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sindex`(`data_table`, `data_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_data_log
-- ----------------------------
INSERT INTO `sys_data_log` VALUES ('402880f05ab0d198015ab12274bf0006', 'admin', '2017-03-09 11:35:09', NULL, NULL, 'jeecg_demo', '4028ef81550c1a7901550c1cd6e70001', '{\"mobilePhone\":\"\",\"officePhone\":\"\",\"email\":\"\",\"createDate\":\"Jun 23, 2016 12:00:00 PM\",\"sex\":\"1\",\"depId\":\"402880e447e99cf10147e9a03b320003\",\"userName\":\"9001\",\"status\":\"1\",\"content\":\"111\",\"id\":\"4028ef81550c1a7901550c1cd6e70001\"}', 3);
INSERT INTO `sys_data_log` VALUES ('402880f05ab6d12b015ab700bead0009', 'admin', '2017-03-10 14:56:03', NULL, NULL, 'jeecg_demo', '402880f05ab6d12b015ab700be8d0008', '{\"mobilePhone\":\"\",\"officePhone\":\"\",\"email\":\"\",\"createDate\":\"Mar 10, 2017 2:56:03 PM\",\"sex\":\"0\",\"depId\":\"402880e447e99cf10147e9a03b320003\",\"userName\":\"111\",\"status\":\"0\",\"id\":\"402880f05ab6d12b015ab700be8d0008\"}', 1);
INSERT INTO `sys_data_log` VALUES ('402880f05ab6d12b015ab705a23f000d', 'admin', '2017-03-10 15:01:24', NULL, NULL, 'jeecg_demo', '402880f05ab6d12b015ab705a233000c', '{\"mobilePhone\":\"\",\"officePhone\":\"11\",\"email\":\"\",\"createDate\":\"Mar 10, 2017 3:01:24 PM\",\"sex\":\"0\",\"depId\":\"402880e447e99cf10147e9a03b320003\",\"userName\":\"11\",\"status\":\"0\",\"id\":\"402880f05ab6d12b015ab705a233000c\"}', 1);
INSERT INTO `sys_data_log` VALUES ('402880f05ab6d12b015ab712a6420013', 'admin', '2017-03-10 15:15:37', NULL, NULL, 'jeecg_demo', '402880f05ab6d12b015ab712a6360012', '{\"mobilePhone\":\"\",\"officePhone\":\"\",\"email\":\"\",\"createDate\":\"Mar 10, 2017 3:15:37 PM\",\"sex\":\"0\",\"depId\":\"402880e447e99cf10147e9a03b320003\",\"userName\":\"小王\",\"status\":\"0\",\"id\":\"402880f05ab6d12b015ab712a6360012\"}', 1);
INSERT INTO `sys_data_log` VALUES ('402880f05ab6d12b015ab712d0510015', 'admin', '2017-03-10 15:15:47', NULL, NULL, 'jeecg_demo', '402880f05ab6d12b015ab712a6360012', '{\"mobilePhone\":\"18611788111\",\"officePhone\":\"\",\"email\":\"\",\"createDate\":\"Mar 10, 2017 3:15:37 AM\",\"sex\":\"0\",\"depId\":\"402880e447e99cf10147e9a03b320003\",\"userName\":\"小王\",\"status\":\"0\",\"id\":\"402880f05ab6d12b015ab712a6360012\"}', 2);
INSERT INTO `sys_data_log` VALUES ('402880f05ab6d12b015ab71308240018', 'admin', '2017-03-10 15:16:02', NULL, NULL, 'jeecg_demo', '8a8ab0b246dc81120146dc81860f016f', '{\"mobilePhone\":\"13111111111\",\"officePhone\":\"66666666\",\"email\":\"demo@jeecg.com\",\"age\":12,\"salary\":10.00,\"birthday\":\"Feb 14, 2014 12:00:00 AM\",\"sex\":\"1\",\"depId\":\"402880e447e99cf10147e9a03b320003\",\"userName\":\"小明\",\"status\":\"\",\"content\":\"\",\"id\":\"8a8ab0b246dc81120146dc81860f016f\"}', 1);
INSERT INTO `sys_data_log` VALUES ('402880f05ab6d12b015ab72806c3001b', 'admin', '2017-03-10 15:38:58', NULL, NULL, 'jeecg_demo', '8a8ab0b246dc81120146dc81860f016f', '{\"mobilePhone\":\"18611788888\",\"officePhone\":\"66666666\",\"email\":\"demo@jeecg.com\",\"age\":12,\"salary\":10.00,\"birthday\":\"Feb 14, 2014 12:00:00 AM\",\"sex\":\"1\",\"depId\":\"402880e447e99cf10147e9a03b320003\",\"userName\":\"小明\",\"status\":\"\",\"content\":\"\",\"id\":\"8a8ab0b246dc81120146dc81860f016f\"}', 2);
INSERT INTO `sys_data_log` VALUES ('4028ef815318148a0153181567690001', 'admin', '2016-02-25 18:59:29', NULL, NULL, 'jeecg_demo', '4028ef815318148a0153181566270000', '{\"mobilePhone\":\"13423423423\",\"officePhone\":\"1\",\"email\":\"\",\"age\":1,\"salary\":1,\"birthday\":\"Feb 25, 2016 12:00:00 AM\",\"createDate\":\"Feb 25, 2016 6:59:24 PM\",\"depId\":\"402880e447e9a9570147e9b6a3be0005\",\"userName\":\"1\",\"status\":\"0\",\"id\":\"4028ef815318148a0153181566270000\"}', 1);
INSERT INTO `sys_data_log` VALUES ('4028ef815318148a01531815ec5c0003', 'admin', '2016-02-25 19:00:03', NULL, NULL, 'jeecg_demo', '4028ef815318148a0153181566270000', '{\"mobilePhone\":\"13426498659\",\"officePhone\":\"1\",\"email\":\"\",\"age\":1,\"salary\":1.00,\"birthday\":\"Feb 25, 2016 12:00:00 AM\",\"createDate\":\"Feb 25, 2016 6:59:24 AM\",\"depId\":\"402880e447e9a9570147e9b6a3be0005\",\"userName\":\"1\",\"status\":\"0\",\"id\":\"4028ef815318148a0153181566270000\"}', 2);
INSERT INTO `sys_data_log` VALUES ('4028ef8153c028db0153c0502e6b0003', 'admin', '2016-03-29 10:59:53', NULL, NULL, 'jeecg_demo', '4028ef8153c028db0153c0502d420002', '{\"mobilePhone\":\"18455477548\",\"officePhone\":\"123\",\"email\":\"\",\"createDate\":\"Mar 29, 2016 10:59:53 AM\",\"depId\":\"402880e447e99cf10147e9a03b320003\",\"userName\":\"123\",\"status\":\"0\",\"id\":\"4028ef8153c028db0153c0502d420002\"}', 1);
INSERT INTO `sys_data_log` VALUES ('4028ef8153c028db0153c0509aa40006', 'admin', '2016-03-29 11:00:21', NULL, NULL, 'jeecg_demo', '4028ef8153c028db0153c0509a3e0005', '{\"mobilePhone\":\"13565486458\",\"officePhone\":\"\",\"email\":\"\",\"createDate\":\"Mar 29, 2016 11:00:21 AM\",\"depId\":\"402880e447e99cf10147e9a03b320003\",\"userName\":\"22\",\"status\":\"0\",\"id\":\"4028ef8153c028db0153c0509a3e0005\"}', 1);
INSERT INTO `sys_data_log` VALUES ('4028ef8153c028db0153c051c4a70008', 'admin', '2016-03-29 11:01:37', NULL, NULL, 'jeecg_demo', '4028ef8153c028db0153c0509a3e0005', '{\"mobilePhone\":\"13565486458\",\"officePhone\":\"\",\"email\":\"\",\"createDate\":\"Mar 29, 2016 11:00:21 AM\",\"depId\":\"402880e447e99cf10147e9a03b320003\",\"userName\":\"22\",\"status\":\"0\",\"id\":\"4028ef8153c028db0153c0509a3e0005\"}', 2);
INSERT INTO `sys_data_log` VALUES ('4028ef8153c028db0153c051d4b5000a', 'admin', '2016-03-29 11:01:41', NULL, NULL, 'jeecg_demo', '4028ef8153c028db0153c0502d420002', '{\"mobilePhone\":\"13565486458\",\"officePhone\":\"123\",\"email\":\"\",\"createDate\":\"Mar 29, 2016 10:59:53 AM\",\"depId\":\"402880e447e99cf10147e9a03b320003\",\"userName\":\"123\",\"status\":\"0\",\"id\":\"4028ef8153c028db0153c0502d420002\"}', 2);
INSERT INTO `sys_data_log` VALUES ('4028ef8153c028db0153c07033d8000d', 'admin', '2016-03-29 11:34:52', NULL, NULL, 'jeecg_demo', '4028ef8153c028db0153c0502d420002', '{\"mobilePhone\":\"13565486458\",\"officePhone\":\"123\",\"email\":\"\",\"age\":23,\"createDate\":\"Mar 29, 2016 10:59:53 AM\",\"depId\":\"402880e447e99cf10147e9a03b320003\",\"userName\":\"123\",\"status\":\"0\",\"id\":\"4028ef8153c028db0153c0502d420002\"}', 3);
INSERT INTO `sys_data_log` VALUES ('4028ef8153c028db0153c070492e000f', 'admin', '2016-03-29 11:34:57', NULL, NULL, 'jeecg_demo', '4028ef8153c028db0153c0509a3e0005', '{\"mobilePhone\":\"13565486458\",\"officePhone\":\"\",\"email\":\"\",\"age\":22,\"createDate\":\"Mar 29, 2016 11:00:21 AM\",\"depId\":\"402880e447e99cf10147e9a03b320003\",\"userName\":\"22\",\"status\":\"0\",\"id\":\"4028ef8153c028db0153c0509a3e0005\"}', 3);
INSERT INTO `sys_data_log` VALUES ('4028ef81550c1a7901550c1cd7850002', 'admin', '2016-06-01 21:17:44', NULL, NULL, 'jeecg_demo', '4028ef81550c1a7901550c1cd6e70001', '{\"mobilePhone\":\"\",\"officePhone\":\"\",\"email\":\"\",\"createDate\":\"Jun 1, 2016 9:17:44 PM\",\"sex\":\"1\",\"depId\":\"402880e447e99cf10147e9a03b320003\",\"userName\":\"121221\",\"status\":\"0\",\"id\":\"4028ef81550c1a7901550c1cd6e70001\"}', 1);
INSERT INTO `sys_data_log` VALUES ('4028ef81568c31ec01568c3307080004', 'admin', '2016-08-15 11:16:09', NULL, NULL, 'jeecg_demo', '4028ef81550c1a7901550c1cd6e70001', '{\"mobilePhone\":\"\",\"officePhone\":\"\",\"email\":\"\",\"createDate\":\"Jun 23, 2016 12:00:00 PM\",\"sex\":\"1\",\"depId\":\"402880e447e99cf10147e9a03b320003\",\"userName\":\"9001\",\"status\":\"1\",\"content\":\"111\",\"id\":\"4028ef81550c1a7901550c1cd6e70001\"}', 2);

-- ----------------------------
-- Table structure for sys_data_source
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_source`;
CREATE TABLE `sys_data_source`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源编码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源名称',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `db_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库类型',
  `db_driver` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驱动类',
  `db_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源地址',
  `db_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `db_username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `db_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sys_data_source_code_uni`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_data_source
-- ----------------------------
INSERT INTO `sys_data_source` VALUES ('1209779538310004737', 'local_mysql', 'MySQL5.7', '本地数据库MySQL5.7', '1', 'com.mysql.jdbc.Driver', 'jdbc:mysql://127.0.0.1:3306/jeecg-boot?characterEncoding=UTF-8&useUnicode=true&useSSL=false', 'jeecg-boot', 'root', 'root', 'admin', '2019-12-25 18:14:53', NULL, NULL, 'A01');

-- ----------------------------
-- Table structure for sys_depart
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart`;
CREATE TABLE `sys_depart`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父机构ID',
  `depart_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构/部门名称',
  `depart_name_en` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名',
  `depart_name_abbr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩写',
  `depart_order` int(11) NULL DEFAULT 0 COMMENT '排序',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `org_category` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '机构类别 1组织机构，2岗位',
  `org_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型 1一级部门 2子部门',
  `org_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构编码',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `fax` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `memo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态（1启用，0不启用）',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除状态（0，正常，1已删除）',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_depart_org_code`(`org_code`) USING BTREE,
  INDEX `index_depart_parent_id`(`parent_id`) USING BTREE,
  INDEX `index_depart_depart_order`(`depart_order`) USING BTREE,
  INDEX `index_depart_org_code`(`org_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织机构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_depart
-- ----------------------------
INSERT INTO `sys_depart` VALUES ('4f1765520d6346f9bd9c79e2479e5b12', 'c6d7cb4deeac411cb3384b1b31278596', '市场部', NULL, NULL, 0, NULL, '1', '2', 'A01A03', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-20 17:15:34', 'admin', '2019-02-26 16:36:18');
INSERT INTO `sys_depart` VALUES ('5159cde220114246b045e574adceafe9', '6d35e179cd814e3299bd588ea7daed3f', '研发部', NULL, NULL, 0, NULL, '1', '2', 'A02A02', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-26 16:44:38', 'admin', '2019-03-07 09:36:53');
INSERT INTO `sys_depart` VALUES ('57197590443c44f083d42ae24ef26a2c', 'c6d7cb4deeac411cb3384b1b31278596', '研发部', NULL, NULL, 0, NULL, '1', '2', 'A01A05', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-21 16:14:41', 'admin', '2019-03-27 19:05:49');
INSERT INTO `sys_depart` VALUES ('63775228b7b041a99825f79760590b7d', '57197590443c44f083d42ae24ef26a2c', '研发经理', NULL, NULL, 0, NULL, '3', '3', 'A01A05A01', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2020-05-02 15:29:09', NULL, NULL);
INSERT INTO `sys_depart` VALUES ('67fc001af12a4f9b8458005d3f19934a', 'c6d7cb4deeac411cb3384b1b31278596', '财务部', NULL, NULL, 0, NULL, '1', '2', 'A01A04', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-21 16:14:35', 'admin', '2019-02-25 12:49:41');
INSERT INTO `sys_depart` VALUES ('6d35e179cd814e3299bd588ea7daed3f', '', '北京卓尔互动', NULL, NULL, 0, NULL, '1', '1', 'A02', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-26 16:36:39', 'admin', '2020-05-02 18:21:22');
INSERT INTO `sys_depart` VALUES ('743ba9dbdc114af8953a11022ef3096a', 'f28c6f53abd841ac87ead43afc483433', '财务部', NULL, NULL, 0, NULL, '1', '2', 'A03A01', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-03-22 16:45:43', NULL, NULL);
INSERT INTO `sys_depart` VALUES ('a7d7e77e06c84325a40932163adcdaa6', '6d35e179cd814e3299bd588ea7daed3f', '财务部', NULL, NULL, 0, NULL, '1', '2', 'A02A01', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-26 16:36:47', 'admin', '2019-02-26 16:37:25');
INSERT INTO `sys_depart` VALUES ('c6d7cb4deeac411cb3384b1b31278596', '', '北京国炬软件', NULL, NULL, 0, NULL, '1', '1', 'A01', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-11 14:21:51', 'admin', '2020-05-02 18:21:27');

-- ----------------------------
-- Table structure for sys_depart_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart_permission`;
CREATE TABLE `sys_depart_permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `depart_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `permission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限id',
  `data_rule_ids` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据规则id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_depart_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart_role`;
CREATE TABLE `sys_depart_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `depart_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `role_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门角色名称',
  `role_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门角色编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_depart_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart_role_permission`;
CREATE TABLE `sys_depart_role_permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `depart_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `permission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限id',
  `data_rule_ids` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_group_role_per_id`(`role_id`, `permission_id`) USING BTREE,
  INDEX `index_group_role_id`(`role_id`) USING BTREE,
  INDEX `index_group_per_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_depart_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart_role_user`;
CREATE TABLE `sys_depart_role_user`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `drole_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门角色用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典名称',
  `dict_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `del_flag` int(1) NULL DEFAULT NULL COMMENT '删除状态',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `type` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '字典类型0为string,1为number',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `indextable_dict_code`(`dict_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('0b5d19e1fce4b2e6647e6b4a17760c14', '通告类型', 'msg_category', '消息类型1:通知公告2:系统消息', 0, 'admin', '2019-04-22 18:01:35', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1174509082208395266', '职务职级', 'position_rank', '职务表职级字典', 0, 'admin', '2019-09-19 10:22:41', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1174511106530525185', '机构类型', 'org_category', '机构类型 1公司，2部门 3岗位', 0, 'admin', '2019-09-19 10:30:43', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1178295274528845826', '表单权限策略', 'form_perms_type', '', 0, 'admin', '2019-09-29 21:07:39', 'admin', '2019-09-29 21:08:26', NULL);
INSERT INTO `sys_dict` VALUES ('1199517671259906049', '紧急程度', 'urgent_level', '日程计划紧急程度', 0, 'admin', '2019-11-27 10:37:53', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1199518099888414722', '日程计划类型', 'eoa_plan_type', '', 0, 'admin', '2019-11-27 10:39:36', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1199520177767587841', '分类栏目类型', 'eoa_cms_menu_type', '', 0, 'admin', '2019-11-27 10:47:51', 'admin', '2019-11-27 10:49:35', 0);
INSERT INTO `sys_dict` VALUES ('1199525215290306561', '日程计划状态', 'eoa_plan_status', '', 0, 'admin', '2019-11-27 11:07:52', 'admin', '2019-11-27 11:10:11', 0);
INSERT INTO `sys_dict` VALUES ('1209733563293962241', '数据库类型', 'database_type', '', 0, 'admin', '2019-12-25 15:12:12', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1232913193820581889', 'Online表单业务分类', 'ol_form_biz_type', '', 0, 'admin', '2020-02-27 14:19:46', 'admin', '2020-02-27 14:20:23', 0);
INSERT INTO `sys_dict` VALUES ('1250687930947620866', '定时任务状态', 'quartz_status', '', 0, 'admin', '2020-04-16 15:30:14', '', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1287578407607242754', '是否启用', 'enabled', '', 0, 'admin', '2020-07-27 10:39:49', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1287579789416501249', '租赁状态', 'leasestate', '', 0, 'admin', '2020-07-27 10:45:19', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1287580176450097153', '主板状态', 'mainboard', '', 0, 'admin', '2020-07-27 10:46:51', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1287581908714426369', '滤芯状态', 'filterelement_type', '', 0, 'admin', '2020-07-27 10:53:44', 'admin', '2020-07-27 10:54:18', 0);
INSERT INTO `sys_dict` VALUES ('1288734107301351426', '是否上传过人脸', 'faceExist', '', 0, 'admin', '2020-07-30 15:12:09', 'admin', '2020-07-30 15:12:57', 0);
INSERT INTO `sys_dict` VALUES ('236e8a4baff0db8c62c00dd95632834f', '同步工作流引擎', 'activiti_sync', '同步工作流引擎', 0, 'admin', '2019-05-15 15:27:33', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('2e02df51611a4b9632828ab7e5338f00', '权限策略', 'perms_type', '权限策略', 0, 'admin', '2019-04-26 18:26:55', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('2f0320997ade5dd147c90130f7218c3e', '推送类别', 'msg_type', '', 0, 'admin', '2019-03-17 21:21:32', 'admin', '2019-03-26 19:57:45', 0);
INSERT INTO `sys_dict` VALUES ('3486f32803bb953e7155dab3513dc68b', '删除状态', 'del_flag', NULL, 0, 'admin', '2019-01-18 21:46:26', 'admin', '2019-03-30 11:17:11', 0);
INSERT INTO `sys_dict` VALUES ('3d9a351be3436fbefb1307d4cfb49bf2', '性别', 'sex', NULL, 0, NULL, '2019-01-04 14:56:32', 'admin', '2019-03-30 11:28:27', 1);
INSERT INTO `sys_dict` VALUES ('4274efc2292239b6f000b153f50823ff', '全局权限策略', 'global_perms_type', '全局权限策略', 0, 'admin', '2019-05-10 17:54:05', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('4c03fca6bf1f0299c381213961566349', 'Online图表展示模板', 'online_graph_display_template', 'Online图表展示模板', 0, 'admin', '2019-04-12 17:28:50', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('4c753b5293304e7a445fd2741b46529d', '字典状态', 'dict_item_status', NULL, 0, 'admin', '2020-06-18 23:18:42', 'admin', '2019-03-30 19:33:52', 1);
INSERT INTO `sys_dict` VALUES ('4d7fec1a7799a436d26d02325eff295e', '优先级', 'priority', '优先级', 0, 'admin', '2019-03-16 17:03:34', 'admin', '2019-04-16 17:39:23', 0);
INSERT INTO `sys_dict` VALUES ('4e4602b3e3686f0911384e188dc7efb4', '条件规则', 'rule_conditions', '', 0, 'admin', '2019-04-01 10:15:03', 'admin', '2019-04-01 10:30:47', 0);
INSERT INTO `sys_dict` VALUES ('4f69be5f507accea8d5df5f11346181a', '发送消息类型', 'msgType', NULL, 0, 'admin', '2019-04-11 14:27:09', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('68168534ff5065a152bfab275c2136f8', '有效无效状态', 'valid_status', '有效无效状态', 0, 'admin', '2020-09-26 19:21:14', 'admin', '2019-04-26 19:21:23', 0);
INSERT INTO `sys_dict` VALUES ('6b78e3f59faec1a4750acff08030a79b', '用户类型', 'user_type', NULL, 0, NULL, '2019-01-04 14:59:01', 'admin', '2019-03-18 23:28:18', 0);
INSERT INTO `sys_dict` VALUES ('72cce0989df68887546746d8f09811aa', 'Online表单类型', 'cgform_table_type', '', 0, 'admin', '2019-01-27 10:13:02', 'admin', '2019-03-30 11:37:36', 0);
INSERT INTO `sys_dict` VALUES ('78bda155fe380b1b3f175f1e88c284c6', '流程状态', 'bpm_status', '流程状态', 0, 'admin', '2019-05-09 16:31:52', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('83bfb33147013cc81640d5fd9eda030c', '日志类型', 'log_type', NULL, 0, 'admin', '2019-03-18 23:22:19', NULL, NULL, 1);
INSERT INTO `sys_dict` VALUES ('845da5006c97754728bf48b6a10f79cc', '状态', 'status', NULL, 0, 'admin', '2019-03-18 21:45:25', 'admin', '2019-03-18 21:58:25', 0);
INSERT INTO `sys_dict` VALUES ('880a895c98afeca9d9ac39f29e67c13e', '操作类型', 'operate_type', '操作类型', 0, 'admin', '2019-07-22 10:54:29', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('8dfe32e2d29ea9430a988b3b558bf233', '发布状态', 'send_status', '发布状态', 0, 'admin', '2019-04-16 17:40:42', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('a7adbcd86c37f7dbc9b66945c82ef9e6', '1是0否', 'yn', '', 0, 'admin', '2019-05-22 19:29:29', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('a9d9942bd0eccb6e89de92d130ec4c4a', '消息发送状态', 'msgSendStatus', NULL, 0, 'admin', '2019-04-12 18:18:17', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('ac2f7c0c5c5775fcea7e2387bcb22f01', '菜单类型', 'menu_type', NULL, 0, 'admin', '2020-12-18 23:24:32', 'admin', '2019-04-01 15:27:06', 1);
INSERT INTO `sys_dict` VALUES ('ad7c65ba97c20a6805d5dcdf13cdaf36', 'onlineT类型', 'ceshi_online', NULL, 0, 'admin', '2019-03-22 16:31:49', 'admin', '2019-03-22 16:34:16', 0);
INSERT INTO `sys_dict` VALUES ('bd1b8bc28e65d6feefefb6f3c79f42fd', 'Online图表数据类型', 'online_graph_data_type', 'Online图表数据类型', 0, 'admin', '2019-04-12 17:24:24', 'admin', '2019-04-12 17:24:57', 0);
INSERT INTO `sys_dict` VALUES ('c36169beb12de8a71c8683ee7c28a503', '部门状态', 'depart_status', NULL, 0, 'admin', '2019-03-18 21:59:51', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('c5a14c75172783d72cbee6ee7f5df5d1', 'Online图表类型', 'online_graph_type', 'Online图表类型', 0, 'admin', '2019-04-12 17:04:06', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('d6e1152968b02d69ff358c75b48a6ee1', '流程类型', 'bpm_process_type', NULL, 0, 'admin', '2021-02-22 19:26:54', 'admin', '2019-03-30 18:14:44', 0);
INSERT INTO `sys_dict` VALUES ('fc6cd58fde2e8481db10d3a1e68ce70c', '用户状态', 'user_status', NULL, 0, 'admin', '2019-03-18 21:57:25', 'admin', '2019-03-18 23:11:58', 1);

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dict_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典id',
  `item_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典项文本',
  `item_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典项值',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort_order` int(10) NULL DEFAULT NULL COMMENT '排序',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态（1启用 0不启用）',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_table_dict_id`(`dict_id`) USING BTREE,
  INDEX `index_table_sort_order`(`sort_order`) USING BTREE,
  INDEX `index_table_dict_status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES ('0072d115e07c875d76c9b022e2179128', '4d7fec1a7799a436d26d02325eff295e', '低', 'L', '低', 3, 1, 'admin', '2019-04-16 17:04:59', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('05a2e732ce7b00aa52141ecc3e330b4e', '3486f32803bb953e7155dab3513dc68b', '已删除', '1', NULL, NULL, 1, 'admin', '2025-10-18 21:46:56', 'admin', '2019-03-28 22:23:20');
INSERT INTO `sys_dict_item` VALUES ('096c2e758d823def3855f6376bc736fb', 'bd1b8bc28e65d6feefefb6f3c79f42fd', 'SQL', 'sql', NULL, 1, 1, 'admin', '2019-04-12 17:26:26', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('0c9532916f5cd722017b46bc4d953e41', '2f0320997ade5dd147c90130f7218c3e', '指定用户', 'USER', NULL, NULL, 1, 'admin', '2019-03-17 21:22:19', 'admin', '2019-03-17 21:22:28');
INSERT INTO `sys_dict_item` VALUES ('0ca4beba9efc4f9dd54af0911a946d5c', '72cce0989df68887546746d8f09811aa', '附表', '3', NULL, 3, 1, 'admin', '2019-03-27 10:13:43', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1030a2652608f5eac3b49d70458b8532', '2e02df51611a4b9632828ab7e5338f00', '禁用', '2', '禁用', 2, 1, 'admin', '2021-03-26 18:27:28', 'admin', '2019-04-26 18:39:11');
INSERT INTO `sys_dict_item` VALUES ('1174509082208395266', '1174511106530525185', '岗位', '3', '岗位', 1, 1, 'admin', '2019-09-19 10:31:16', '', NULL);
INSERT INTO `sys_dict_item` VALUES ('1174509601047994369', '1174509082208395266', '员级', '1', '', 1, 1, 'admin', '2019-09-19 10:24:45', 'admin', '2019-09-23 11:46:39');
INSERT INTO `sys_dict_item` VALUES ('1174509667297026049', '1174509082208395266', '助级', '2', '', 2, 1, 'admin', '2019-09-19 10:25:01', 'admin', '2019-09-23 11:46:47');
INSERT INTO `sys_dict_item` VALUES ('1174509713568587777', '1174509082208395266', '中级', '3', '', 3, 1, 'admin', '2019-09-19 10:25:12', 'admin', '2019-09-23 11:46:56');
INSERT INTO `sys_dict_item` VALUES ('1174509788361416705', '1174509082208395266', '副高级', '4', '', 4, 1, 'admin', '2019-09-19 10:25:30', 'admin', '2019-09-23 11:47:06');
INSERT INTO `sys_dict_item` VALUES ('1174509835803189250', '1174509082208395266', '正高级', '5', '', 5, 1, 'admin', '2019-09-19 10:25:41', 'admin', '2019-09-23 11:47:12');
INSERT INTO `sys_dict_item` VALUES ('1174511197735665665', '1174511106530525185', '公司', '1', '公司', 1, 1, 'admin', '2019-09-19 10:31:05', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1174511244036587521', '1174511106530525185', '部门', '2', '部门', 1, 1, 'admin', '2019-09-19 10:31:16', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1178295553450061826', '1178295274528845826', '可编辑(未授权禁用)', '2', '', 2, 1, 'admin', '2019-09-29 21:08:46', 'admin', '2019-09-29 21:09:18');
INSERT INTO `sys_dict_item` VALUES ('1178295639554928641', '1178295274528845826', '可见(未授权不可见)', '1', '', 1, 1, 'admin', '2019-09-29 21:09:06', 'admin', '2019-09-29 21:09:24');
INSERT INTO `sys_dict_item` VALUES ('1199517884758368257', '1199517671259906049', '一般', '1', '', 1, 1, 'admin', '2019-11-27 10:38:44', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199517914017832962', '1199517671259906049', '重要', '2', '', 1, 1, 'admin', '2019-11-27 10:38:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199517941339529217', '1199517671259906049', '紧急', '3', '', 1, 1, 'admin', '2019-11-27 10:38:58', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199518186144276482', '1199518099888414722', '日常记录', '1', '', 1, 1, 'admin', '2019-11-27 10:39:56', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199518214858481666', '1199518099888414722', '本周工作', '2', '', 1, 1, 'admin', '2019-11-27 10:40:03', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199518235943247874', '1199518099888414722', '下周计划', '3', '', 1, 1, 'admin', '2019-11-27 10:40:08', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199520817285701634', '1199520177767587841', '列表', '1', '', 1, 1, 'admin', '2019-11-27 10:50:24', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199520835035996161', '1199520177767587841', '链接', '2', '', 1, 1, 'admin', '2019-11-27 10:50:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199525468672405505', '1199525215290306561', '未开始', '0', '', 1, 1, 'admin', '2019-11-27 11:08:52', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199525490575060993', '1199525215290306561', '进行中', '1', '', 1, 1, 'admin', '2019-11-27 11:08:58', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199525506429530114', '1199525215290306561', '已完成', '2', '', 1, 1, 'admin', '2019-11-27 11:09:02', 'admin', '2019-11-27 11:10:02');
INSERT INTO `sys_dict_item` VALUES ('1199607547704647681', '4f69be5f507accea8d5df5f11346181a', '系统', '4', '', 1, 1, 'admin', '2019-11-27 16:35:02', 'admin', '2019-11-27 19:37:46');
INSERT INTO `sys_dict_item` VALUES ('1209733775114702850', '1209733563293962241', 'MySQL', '1', '', 1, 1, 'admin', '2019-12-25 15:13:02', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1209733839933476865', '1209733563293962241', 'Oracle', '2', '', 1, 1, 'admin', '2019-12-25 15:13:18', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1209733903020003330', '1209733563293962241', 'SQLServer', '3', '', 1, 1, 'admin', '2019-12-25 15:13:33', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1232913424813486081', '1232913193820581889', '官方示例', 'demo', '', 1, 1, 'admin', '2020-02-27 14:20:42', 'admin', '2020-02-27 14:21:37');
INSERT INTO `sys_dict_item` VALUES ('1232913493717512194', '1232913193820581889', '流程表单', 'bpm', '', 2, 1, 'admin', '2020-02-27 14:20:58', 'admin', '2020-02-27 14:22:20');
INSERT INTO `sys_dict_item` VALUES ('1232913605382467585', '1232913193820581889', '测试表单', 'temp', '', 4, 1, 'admin', '2020-02-27 14:21:25', 'admin', '2020-02-27 14:22:16');
INSERT INTO `sys_dict_item` VALUES ('1232914232372195330', '1232913193820581889', '导入表单', 'bdfl_include', '', 5, 1, 'admin', '2020-02-27 14:23:54', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1234371726545010689', '4e4602b3e3686f0911384e188dc7efb4', '左模糊', 'LEFT_LIKE', '左模糊', 7, 1, 'admin', '2020-03-02 14:55:27', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1234371809495760898', '4e4602b3e3686f0911384e188dc7efb4', '右模糊', 'RIGHT_LIKE', '右模糊', 7, 1, 'admin', '2020-03-02 14:55:47', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1250688147579228161', '1250687930947620866', '正常', '0', '', 1, 1, 'admin', '2020-04-16 15:31:05', '', NULL);
INSERT INTO `sys_dict_item` VALUES ('1250688201064992770', '1250687930947620866', '停止', '-1', '', 1, 1, 'admin', '2020-04-16 15:31:18', '', NULL);
INSERT INTO `sys_dict_item` VALUES ('1287578931115102209', '1287578407607242754', '启用', '2', '', 1, 1, 'admin', '2020-07-27 10:41:54', 'admin', '2020-07-29 11:21:57');
INSERT INTO `sys_dict_item` VALUES ('1287579034450169857', '1287578407607242754', '未启用', '1', '', 1, 1, 'admin', '2020-07-27 10:42:19', 'admin', '2020-07-29 11:22:04');
INSERT INTO `sys_dict_item` VALUES ('1287580564347719681', '1287579789416501249', '租', '2', '', 1, 1, 'admin', '2020-07-27 10:48:23', 'admin', '2020-07-27 11:39:34');
INSERT INTO `sys_dict_item` VALUES ('1287581191165480962', '1287579789416501249', '售', '1', '', 1, 1, 'admin', '2020-07-27 10:50:53', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1287581391263141890', '1287580176450097153', '关机', '1', '', 1, 1, 'admin', '2020-07-27 10:51:40', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1287581452244127745', '1287580176450097153', '开机', '2', '', 1, 1, 'admin', '2020-07-27 10:51:55', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1287581524021252097', '1287580176450097153', '一档', '3', '', 1, 1, 'admin', '2020-07-27 10:52:12', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1287581570276036610', '1287580176450097153', '二档', '4', '', 1, 1, 'admin', '2020-07-27 10:52:23', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1287581694582624257', '1287580176450097153', '三档', '5', '', 1, 1, 'admin', '2020-07-27 10:52:53', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1287581790615408642', '1287580176450097153', '四档', '6', '', 1, 1, 'admin', '2020-07-27 10:53:16', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1287582234569904130', '1287581908714426369', '正常', '1', '', 1, 1, 'admin', '2020-07-27 10:55:01', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1287582452124258305', '1287581908714426369', '异常', '2', '', 1, 1, 'admin', '2020-07-27 10:55:53', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1288734578552377346', '1288734107301351426', '暂未上传', '1', '', 1, 1, 'admin', '2020-07-30 15:14:02', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1288734780143210497', '1288734107301351426', '已上传', '2', '', 2, 1, 'admin', '2020-07-30 15:14:50', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('147c48ff4b51545032a9119d13f3222a', 'd6e1152968b02d69ff358c75b48a6ee1', '测试流程', 'test', NULL, 1, 1, 'admin', '2019-03-22 19:27:05', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1543fe7e5e26fb97cdafe4981bedc0c8', '4c03fca6bf1f0299c381213961566349', '单排布局', 'single', NULL, 2, 1, 'admin', '2022-07-12 17:43:39', 'admin', '2019-04-12 17:43:57');
INSERT INTO `sys_dict_item` VALUES ('1ce390c52453891f93514c1bd2795d44', 'ad7c65ba97c20a6805d5dcdf13cdaf36', '000', '00', NULL, 1, 1, 'admin', '2019-03-22 16:34:34', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1db531bcff19649fa82a644c8a939dc4', '4c03fca6bf1f0299c381213961566349', '组合布局', 'combination', '', 4, 1, 'admin', '2019-05-11 16:07:08', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('222705e11ef0264d4214affff1fb4ff9', '4f69be5f507accea8d5df5f11346181a', '短信', '1', '', 1, 1, 'admin', '2023-02-28 10:50:36', 'admin', '2019-04-28 10:58:11');
INSERT INTO `sys_dict_item` VALUES ('23a5bb76004ed0e39414e928c4cde155', '4e4602b3e3686f0911384e188dc7efb4', '不等于', '!=', '不等于', 3, 1, 'admin', '2019-04-01 16:46:15', 'admin', '2019-04-01 17:48:40');
INSERT INTO `sys_dict_item` VALUES ('25847e9cb661a7c711f9998452dc09e6', '4e4602b3e3686f0911384e188dc7efb4', '小于等于', '<=', '小于等于', 6, 1, 'admin', '2019-04-01 16:44:34', 'admin', '2019-04-01 17:49:10');
INSERT INTO `sys_dict_item` VALUES ('2d51376643f220afdeb6d216a8ac2c01', '68168534ff5065a152bfab275c2136f8', '有效', '1', '有效', 2, 1, 'admin', '2019-04-26 19:22:01', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('308c8aadf0c37ecdde188b97ca9833f5', '8dfe32e2d29ea9430a988b3b558bf233', '已发布', '1', '已发布', 2, 1, 'admin', '2019-04-16 17:41:24', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('333e6b2196e01ef9a5f76d74e86a6e33', '8dfe32e2d29ea9430a988b3b558bf233', '未发布', '0', '未发布', 1, 1, 'admin', '2019-04-16 17:41:12', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('337ea1e401bda7233f6258c284ce4f50', 'bd1b8bc28e65d6feefefb6f3c79f42fd', 'JSON', 'json', NULL, 1, 1, 'admin', '2019-04-12 17:26:33', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('33bc9d9f753cf7dc40e70461e50fdc54', 'a9d9942bd0eccb6e89de92d130ec4c4a', '发送失败', '2', NULL, 3, 1, 'admin', '2019-04-12 18:20:02', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('3fbc03d6c994ae06d083751248037c0e', '78bda155fe380b1b3f175f1e88c284c6', '已完成', '3', '已完成', 3, 1, 'admin', '2019-05-09 16:33:25', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('41d7aaa40c9b61756ffb1f28da5ead8e', '0b5d19e1fce4b2e6647e6b4a17760c14', '通知公告', '1', NULL, 1, 1, 'admin', '2019-04-22 18:01:57', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('41fa1e9571505d643aea87aeb83d4d76', '4e4602b3e3686f0911384e188dc7efb4', '等于', '=', '等于', 4, 1, 'admin', '2019-04-01 16:45:24', 'admin', '2019-04-01 17:49:00');
INSERT INTO `sys_dict_item` VALUES ('43d2295b8610adce9510ff196a49c6e9', '845da5006c97754728bf48b6a10f79cc', '正常', '1', NULL, NULL, 1, 'admin', '2019-03-18 21:45:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('4f05fb5376f4c61502c5105f52e4dd2b', '83bfb33147013cc81640d5fd9eda030c', '操作日志', '2', NULL, NULL, 1, 'admin', '2019-03-18 23:22:49', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('50223341bfb5ba30bf6319789d8d17fe', 'd6e1152968b02d69ff358c75b48a6ee1', '业务办理', 'business', NULL, 3, 1, 'admin', '2023-04-22 19:28:05', 'admin', '2019-03-22 23:24:39');
INSERT INTO `sys_dict_item` VALUES ('51222413e5906cdaf160bb5c86fb827c', 'a7adbcd86c37f7dbc9b66945c82ef9e6', '是', '1', '', 1, 1, 'admin', '2019-05-22 19:29:45', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('538fca35afe004972c5f3947c039e766', '2e02df51611a4b9632828ab7e5338f00', '显示', '1', '显示', 1, 1, 'admin', '2025-03-26 18:27:13', 'admin', '2019-04-26 18:39:07');
INSERT INTO `sys_dict_item` VALUES ('5584c21993bde231bbde2b966f2633ac', '4e4602b3e3686f0911384e188dc7efb4', '自定义SQL表达式', 'USE_SQL_RULES', '自定义SQL表达式', 9, 1, 'admin', '2019-04-01 10:45:24', 'admin', '2019-04-01 17:49:27');
INSERT INTO `sys_dict_item` VALUES ('58b73b344305c99b9d8db0fc056bbc0a', '72cce0989df68887546746d8f09811aa', '主表', '2', NULL, 2, 1, 'admin', '2019-03-27 10:13:36', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('5b65a88f076b32e8e69d19bbaadb52d5', '2f0320997ade5dd147c90130f7218c3e', '全体用户', 'ALL', NULL, NULL, 1, 'admin', '2020-10-17 21:22:43', 'admin', '2019-03-28 22:17:09');
INSERT INTO `sys_dict_item` VALUES ('5d833f69296f691843ccdd0c91212b6b', '880a895c98afeca9d9ac39f29e67c13e', '修改', '3', '', 3, 1, 'admin', '2019-07-22 10:55:07', 'admin', '2019-07-22 10:55:41');
INSERT INTO `sys_dict_item` VALUES ('5d84a8634c8fdfe96275385075b105c9', '3d9a351be3436fbefb1307d4cfb49bf2', '女', '2', NULL, 2, 1, NULL, '2019-01-04 14:56:56', NULL, '2019-01-04 17:38:12');
INSERT INTO `sys_dict_item` VALUES ('66c952ae2c3701a993e7db58f3baf55e', '4e4602b3e3686f0911384e188dc7efb4', '大于', '>', '大于', 1, 1, 'admin', '2019-04-01 10:45:46', 'admin', '2019-04-01 17:48:29');
INSERT INTO `sys_dict_item` VALUES ('6937c5dde8f92e9a00d4e2ded9198694', 'ad7c65ba97c20a6805d5dcdf13cdaf36', 'easyui', '3', NULL, 1, 1, 'admin', '2019-03-22 16:32:15', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('69cacf64e244100289ddd4aa9fa3b915', 'a9d9942bd0eccb6e89de92d130ec4c4a', '未发送', '0', NULL, 1, 1, 'admin', '2019-04-12 18:19:23', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('6a7a9e1403a7943aba69e54ebeff9762', '4f69be5f507accea8d5df5f11346181a', '邮件', '2', '', 2, 1, 'admin', '2031-02-28 10:50:44', 'admin', '2019-04-28 10:59:03');
INSERT INTO `sys_dict_item` VALUES ('6c682d78ddf1715baf79a1d52d2aa8c2', '72cce0989df68887546746d8f09811aa', '单表', '1', NULL, 1, 1, 'admin', '2019-03-27 10:13:29', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('6d404fd2d82311fbc87722cd302a28bc', '4e4602b3e3686f0911384e188dc7efb4', '模糊', 'LIKE', '模糊', 7, 1, 'admin', '2019-04-01 16:46:02', 'admin', '2019-04-01 17:49:20');
INSERT INTO `sys_dict_item` VALUES ('6d4e26e78e1a09699182e08516c49fc4', '4d7fec1a7799a436d26d02325eff295e', '高', 'H', '高', 1, 1, 'admin', '2019-04-16 17:04:24', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('700e9f030654f3f90e9ba76ab0713551', '6b78e3f59faec1a4750acff08030a79b', '333', '333', NULL, NULL, 1, 'admin', '2019-02-21 19:59:47', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('7050c1522702bac3be40e3b7d2e1dfd8', 'c5a14c75172783d72cbee6ee7f5df5d1', '柱状图', 'bar', NULL, 1, 1, 'admin', '2019-04-12 17:05:17', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('71b924faa93805c5c1579f12e001c809', 'd6e1152968b02d69ff358c75b48a6ee1', 'OA办公', 'oa', NULL, 2, 1, 'admin', '2021-03-22 19:27:17', 'admin', '2019-03-22 23:24:36');
INSERT INTO `sys_dict_item` VALUES ('75b260d7db45a39fc7f21badeabdb0ed', 'c36169beb12de8a71c8683ee7c28a503', '不启用', '0', NULL, NULL, 1, 'admin', '2019-03-18 23:29:41', 'admin', '2019-03-18 23:29:54');
INSERT INTO `sys_dict_item` VALUES ('7688469db4a3eba61e6e35578dc7c2e5', 'c36169beb12de8a71c8683ee7c28a503', '启用', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:29:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('78ea6cadac457967a4b1c4eb7aaa418c', 'fc6cd58fde2e8481db10d3a1e68ce70c', '正常', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:30:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('7ccf7b80c70ee002eceb3116854b75cb', 'ac2f7c0c5c5775fcea7e2387bcb22f01', '按钮权限', '2', NULL, NULL, 1, 'admin', '2019-03-18 23:25:40', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('81fb2bb0e838dc68b43f96cc309f8257', 'fc6cd58fde2e8481db10d3a1e68ce70c', '冻结', '2', NULL, NULL, 1, 'admin', '2019-03-18 23:30:37', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('83250269359855501ec4e9c0b7e21596', '4274efc2292239b6f000b153f50823ff', '可见/可访问(授权后可见/可访问)', '1', '', 1, 1, 'admin', '2019-05-10 17:54:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('84778d7e928bc843ad4756db1322301f', '4e4602b3e3686f0911384e188dc7efb4', '大于等于', '>=', '大于等于', 5, 1, 'admin', '2019-04-01 10:46:02', 'admin', '2019-04-01 17:49:05');
INSERT INTO `sys_dict_item` VALUES ('848d4da35ebd93782029c57b103e5b36', 'c5a14c75172783d72cbee6ee7f5df5d1', '饼图', 'pie', NULL, 3, 1, 'admin', '2019-04-12 17:05:49', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('84dfc178dd61b95a72900fcdd624c471', '78bda155fe380b1b3f175f1e88c284c6', '处理中', '2', '处理中', 2, 1, 'admin', '2019-05-09 16:33:01', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('86f19c7e0a73a0bae451021ac05b99dd', 'ac2f7c0c5c5775fcea7e2387bcb22f01', '子菜单', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:25:27', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('8bccb963e1cd9e8d42482c54cc609ca2', '4f69be5f507accea8d5df5f11346181a', '微信', '3', NULL, 3, 1, 'admin', '2021-05-11 14:29:12', 'admin', '2019-04-11 14:29:31');
INSERT INTO `sys_dict_item` VALUES ('8c618902365ca681ebbbe1e28f11a548', '4c753b5293304e7a445fd2741b46529d', '启用', '1', '', 0, 1, 'admin', '2020-07-18 23:19:27', 'admin', '2019-05-17 14:51:18');
INSERT INTO `sys_dict_item` VALUES ('8cdf08045056671efd10677b8456c999', '4274efc2292239b6f000b153f50823ff', '可编辑(未授权时禁用)', '2', '', 2, 1, 'admin', '2019-05-10 17:55:38', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('8ff48e657a7c5090d4f2a59b37d1b878', '4d7fec1a7799a436d26d02325eff295e', '中', 'M', '中', 2, 1, 'admin', '2019-04-16 17:04:40', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('948923658baa330319e59b2213cda97c', '880a895c98afeca9d9ac39f29e67c13e', '添加', '2', '', 2, 1, 'admin', '2019-07-22 10:54:59', 'admin', '2019-07-22 10:55:36');
INSERT INTO `sys_dict_item` VALUES ('9a96c4a4e4c5c9b4e4d0cbf6eb3243cc', '4c753b5293304e7a445fd2741b46529d', '不启用', '0', NULL, 1, 1, 'admin', '2019-03-18 23:19:53', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('a1e7d1ca507cff4a480c8caba7c1339e', '880a895c98afeca9d9ac39f29e67c13e', '导出', '6', '', 6, 1, 'admin', '2019-07-22 12:06:50', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('a2be752dd4ec980afaec1efd1fb589af', '8dfe32e2d29ea9430a988b3b558bf233', '已撤销', '2', '已撤销', 3, 1, 'admin', '2019-04-16 17:41:39', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('aa0d8a8042a18715a17f0a888d360aa4', 'ac2f7c0c5c5775fcea7e2387bcb22f01', '一级菜单', '0', NULL, NULL, 1, 'admin', '2019-03-18 23:24:52', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('adcf2a1fe93bb99a84833043f475fe0b', '4e4602b3e3686f0911384e188dc7efb4', '包含', 'IN', '包含', 8, 1, 'admin', '2019-04-01 16:45:47', 'admin', '2019-04-01 17:49:24');
INSERT INTO `sys_dict_item` VALUES ('b029a41a851465332ee4ee69dcf0a4c2', '0b5d19e1fce4b2e6647e6b4a17760c14', '系统消息', '2', NULL, 1, 1, 'admin', '2019-02-22 18:02:08', 'admin', '2019-04-22 18:02:13');
INSERT INTO `sys_dict_item` VALUES ('b2a8b4bb2c8e66c2c4b1bb086337f393', '3486f32803bb953e7155dab3513dc68b', '正常', '0', NULL, NULL, 1, 'admin', '2022-10-18 21:46:48', 'admin', '2019-03-28 22:22:20');
INSERT INTO `sys_dict_item` VALUES ('b57f98b88363188daf38d42f25991956', '6b78e3f59faec1a4750acff08030a79b', '22', '222', NULL, NULL, 0, 'admin', '2019-02-21 19:59:43', 'admin', '2019-03-11 21:23:27');
INSERT INTO `sys_dict_item` VALUES ('b5f3bd5f66bb9a83fecd89228c0d93d1', '68168534ff5065a152bfab275c2136f8', '无效', '0', '无效', 1, 1, 'admin', '2019-04-26 19:21:49', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('b9fbe2a3602d4a27b45c100ac5328484', '78bda155fe380b1b3f175f1e88c284c6', '待提交', '1', '待提交', 1, 1, 'admin', '2019-05-09 16:32:35', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('ba27737829c6e0e582e334832703d75e', '236e8a4baff0db8c62c00dd95632834f', '同步', '1', '同步', 1, 1, 'admin', '2019-05-15 15:28:15', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('bcec04526b04307e24a005d6dcd27fd6', '880a895c98afeca9d9ac39f29e67c13e', '导入', '5', '', 5, 1, 'admin', '2019-07-22 12:06:41', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('c53da022b9912e0aed691bbec3c78473', '880a895c98afeca9d9ac39f29e67c13e', '查询', '1', '', 1, 1, 'admin', '2019-07-22 10:54:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('c5700a71ad08994d18ad1dacc37a71a9', 'a7adbcd86c37f7dbc9b66945c82ef9e6', '否', '0', '', 1, 1, 'admin', '2019-05-22 19:29:55', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('cbfcc5b88fc3a90975df23ffc8cbe29c', 'c5a14c75172783d72cbee6ee7f5df5d1', '曲线图', 'line', NULL, 2, 1, 'admin', '2019-05-12 17:05:30', 'admin', '2019-04-12 17:06:06');
INSERT INTO `sys_dict_item` VALUES ('d217592908ea3e00ff986ce97f24fb98', 'c5a14c75172783d72cbee6ee7f5df5d1', '数据列表', 'table', NULL, 4, 1, 'admin', '2019-04-12 17:05:56', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('df168368dcef46cade2aadd80100d8aa', '3d9a351be3436fbefb1307d4cfb49bf2', '男', '1', NULL, 1, 1, NULL, '2027-08-04 14:56:49', 'admin', '2019-03-23 22:44:44');
INSERT INTO `sys_dict_item` VALUES ('e6329e3a66a003819e2eb830b0ca2ea0', '4e4602b3e3686f0911384e188dc7efb4', '小于', '<', '小于', 2, 1, 'admin', '2019-04-01 16:44:15', 'admin', '2019-04-01 17:48:34');
INSERT INTO `sys_dict_item` VALUES ('e94eb7af89f1dbfa0d823580a7a6e66a', '236e8a4baff0db8c62c00dd95632834f', '不同步', '0', '不同步', 2, 1, 'admin', '2019-05-15 15:28:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f0162f4cc572c9273f3e26b2b4d8c082', 'ad7c65ba97c20a6805d5dcdf13cdaf36', 'booostrap', '1', NULL, 1, 1, 'admin', '2021-08-22 16:32:04', 'admin', '2019-03-22 16:33:57');
INSERT INTO `sys_dict_item` VALUES ('f16c5706f3ae05c57a53850c64ce7c45', 'a9d9942bd0eccb6e89de92d130ec4c4a', '发送成功', '1', NULL, 2, 1, 'admin', '2019-04-12 18:19:43', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f2a7920421f3335afdf6ad2b342f6b5d', '845da5006c97754728bf48b6a10f79cc', '冻结', '2', NULL, NULL, 1, 'admin', '2019-03-18 21:46:02', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f37f90c496ec9841c4c326b065e00bb2', '83bfb33147013cc81640d5fd9eda030c', '登录日志', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:22:37', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f753aff60ff3931c0ecb4812d8b5e643', '4c03fca6bf1f0299c381213961566349', '双排布局', 'double', NULL, 3, 1, 'admin', '2019-04-12 17:43:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f80a8f6838215753b05e1a5ba3346d22', '880a895c98afeca9d9ac39f29e67c13e', '删除', '4', '', 4, 1, 'admin', '2019-07-22 10:55:14', 'admin', '2019-07-22 10:55:30');
INSERT INTO `sys_dict_item` VALUES ('fcec03570f68a175e1964808dc3f1c91', '4c03fca6bf1f0299c381213961566349', 'Tab风格', 'tab', NULL, 1, 1, 'admin', '2019-04-12 17:43:31', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('fe50b23ae5e68434def76f67cef35d2d', '78bda155fe380b1b3f175f1e88c284c6', '已作废', '4', '已作废', 4, 1, 'admin', '2021-09-09 16:33:43', 'admin', '2019-05-09 16:34:40');

-- ----------------------------
-- Table structure for sys_fill_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_fill_rule`;
CREATE TABLE `sys_fill_rule`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `rule_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `rule_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则Code',
  `rule_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则实现类',
  `rule_params` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则参数',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_sys_fill_rule_code`(`rule_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_fill_rule
-- ----------------------------
INSERT INTO `sys_fill_rule` VALUES ('1202551334738382850', '机构编码生成', 'org_num_role', 'org.jeecg.modules.system.rule.OrgCodeRule', '{\"parentId\":\"c6d7cb4deeac411cb3384b1b31278596\"}', 'admin', '2019-12-09 10:37:06', 'admin', '2019-12-05 19:32:35');
INSERT INTO `sys_fill_rule` VALUES ('1202787623203065858', '分类字典编码生成', 'category_code_rule', 'org.jeecg.modules.system.rule.CategoryCodeRule', '{\"pid\":\"\"}', 'admin', '2019-12-09 10:36:54', 'admin', '2019-12-06 11:11:31');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `log_type` int(2) NULL DEFAULT NULL COMMENT '日志类型（1登录日志，2操作日志）',
  `log_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志内容',
  `operate_type` int(2) NULL DEFAULT NULL COMMENT '操作类型',
  `userid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户账号',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户名称',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `method` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求java方法',
  `request_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求路径',
  `request_param` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求参数',
  `request_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求类型',
  `cost_time` bigint(20) NULL DEFAULT NULL COMMENT '耗时',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_table_userid`(`userid`) USING BTREE,
  INDEX `index_logt_ype`(`log_type`) USING BTREE,
  INDEX `index_operate_type`(`operate_type`) USING BTREE,
  INDEX `index_log_type`(`log_type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('b09ccd219a1ce5c7270bb659748b8330', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 15:34:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a22ddd4b5b0b84bd7794edd24b25fc64', 2, '添加测试DEMO', NULL, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.add()', NULL, '[{\"createBy\":\"admin\",\"createTime\":1547883299809,\"email\":\"zhangdaiscott@163.com\",\"id\":\"7eac655877842eb39dc2f0469f3964ec\",\"name\":\"zhang daihao\"}]', NULL, 25, 'admin', '2019-01-19 15:34:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('07a0b3f8b4140a7a586305c2f40a2310', 2, '删除测试DEMO', NULL, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.delete()', NULL, '[\"7eac655877842eb39dc2f0469f3964ec\"]', NULL, 14, 'admin', '2019-01-19 15:38:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d7902eeab2c34611fad046a79bff1c1b', 2, '添加测试DEMO', NULL, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.add()', NULL, '[{\"createBy\":\"admin\",\"createTime\":1547883544104,\"email\":\"zhangdaiscott@163.com\",\"id\":\"4436302a0de50bb83025286bc414d6a9\",\"name\":\"zhang daihao\"}]', NULL, 1682, 'admin', '2019-01-19 15:39:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a68160f37cace166fedd299c4ca0be10', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 15:40:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c6c0316b6989bf1eea0a3803f593bf69', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 15:47:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4b1341863a8fffeccda8bbe413bd815f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 15:59:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ed50b1fbc80c3b953f4551081b10335e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 16:19:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('dabdcb8e15ea9215a1af22f7567ff73d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 16:48:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('446724ea6dd41f4a03111c42e00d80cd', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 16:56:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0e41fe3a34d5715bf4c88e220663583a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 17:04:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9f2db1ffaf89518a25cc6701da0c5858', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 17:05:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('954f1ccb8b230d2d7d4858eec3aba0a4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 17:08:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7374f3a2ccb20216cf8eecb26037ce0a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 18:08:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('130de55edac71aab730786307cc65936', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 20:22:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0bc44e2d682c9f28525d203589a90b43', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 20:31:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('122edcafd54dd06e12838f41123d9d5d', 2, '添加测试DEMO', NULL, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.add()', NULL, '[{\"age\":28,\"birthday\":1546617600000,\"createBy\":\"admin\",\"createTime\":1547901234989,\"id\":\"42c08b1a2e5b2a96ffa4cc88383d4b11\",\"name\":\"秦500\",\"punchTime\":1546691611000}]', NULL, 21387, 'admin', '2019-01-19 20:34:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1a570aac0c30ac2955b59e2dc7a6204c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 20:58:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c18db091677ec01d55e913662b9028a9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 21:19:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('88d8b4b50bdab58c52fe25fa711fbbef', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 21:21:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('6b876be6e384337b36ad28a4a5868be8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 21:22:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('cb6b52fbbdd4c5698c17edaf9960e11e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 21:22:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('fea8e1e2d229557185be0d9a10ebce17', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 21:55:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c1842fc83cdf0b0cc0264bf093e9c55d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 21:56:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('543970eba4d1c522e3cb597b0fd4ad13', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 22:53:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e9ce2b3f7ac1fa3f5f7fd247207ca5c0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 22:53:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0e365a21c60e4460813bdc4e3cb320a3', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 23:01:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d3df1a4057b6d7fb4dab073a727ba21f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 23:14:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8f616500d666a5a67bc98e7ccd73c2e2', 2, '添加测试DEMO', NULL, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.add()', NULL, '[{\"createBy\":\"admin\",\"createTime\":1547912194199,\"id\":\"ffa9da1ad40632dfcabac51d766865bd\",\"name\":\"秦999\"}]', NULL, 386, 'admin', '2019-01-19 23:36:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('055cf35c8865761b479c7f289dc36616', 2, '添加测试DEMO', NULL, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.add()', NULL, '[{\"createBy\":\"admin\",\"createTime\":1547912238787,\"email\":\"zhangdaiscott@163.com\",\"id\":\"c2c0d49e3c01913067cf8d1fb3c971d2\",\"name\":\"zhang daihao\"}]', NULL, 16, 'admin', '2019-01-19 23:37:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('69e3164d007be2b9834e4fb398186f39', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-19 23:38:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('92e514fee917a1a459c4ffdb0ca42516', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 10:20:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d3f08843a9b2b3284711e376fb785beb', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 10:58:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('76bea561f662ec0ccf05bc370f1ffe35', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 11:08:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('273081678d85acebaa6615973bff31db', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 15:02:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b26369680b41d581649cf865e88331e9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 15:03:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7313b43ff53015d79a58b4dc7c660721', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 15:03:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f99912c5ff252594f14d31b768f8ad15', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 15:03:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('dcec1957987abbe6658f1f2c96980366', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 15:05:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c7b6156c4f42b70c562b507766f4546c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 15:14:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('52673feae24ea5bc3ca111f19c9a85d4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 15:16:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('507b55d3b5ddc487fb40ca1f716a1253', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 15:43:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7351132f4f5f65e5bf157dd7ad5344a4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 15:51:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('961992e05772bc7ad2ca927cf7649440', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 15:55:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3b07fda32423a5696b2097e1c23c00d4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 16:04:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8447099784da63b3b2cd2fbbc5eabcea', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 16:04:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b20ff98a10af3c25c1991741fd59ea64', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 16:07:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9acebd2d37c9078f9568125fb9696976', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 16:07:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d70c2847d8d0936a2a761f745a84aa48', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 16:39:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('279e519d647f1a4e1f85f9b90ab370b9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 17:01:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b605a83a9b5f3cdaaa1b3f4f41a5f12d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 17:04:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0a24b1f04f79a2bcb83c4cd12d077cbc', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 17:34:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('661c4792f00b0814e486c3d623d7259f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 18:06:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d1746c5c937fcb650bd835ff74dabdff', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 18:06:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8ec3a287a37d155047e80a80769d5226', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 18:37:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('6cbd2a9257fae1cb7ff7bc2eb264b3ab', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 19:08:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f06e8fa83b408be905b4dc7caeaf9a80', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 19:40:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f84e86c9a21149134b1f2599a424164b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-21 20:12:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('88bfc5b77b4be0d6d0f7c8661cf24853', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 10:25:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b9bf472a12fc25a9d4b500421b08b025', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 10:53:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('dbbcfb7f59311637a613ec9a6c63f04a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 10:53:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('69ea2322f72b41bcdc7f235889132703', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 10:54:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('62d197757e2cb40f9e8cb57fa6a207f7', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 10:54:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ccad29843623a6c3ca59548b1d533b15', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 10:56:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4d9299e2daac1f49eac0cec75a90c32e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 11:28:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('43848099c1e70910ba1572868ee40415', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 11:28:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('6fb7db45b11bc22347b234fda07700c8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 12:00:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e8cde8dcd6253b249d67a05aaf10f968', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 12:30:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('6a4231540c73ad67128d5a24e6a877ff', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 12:54:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2b3be3da6ba9d1ee49f378d729d69c50', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 13:24:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('78f519b618f82a39adad391fbf6b9c7a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 13:49:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1487d69ff97888f3a899e2ababb5ae48', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 14:21:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('cc7fa5567e7833a3475b29b7441a2976', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 14:21:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('52e36d72cd04bea2604747e006b038ec', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 19:47:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('523a54948d5edaf421566014b66f9465', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 19:50:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('48e4e10ac7e583050fd85734f0676a7c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 19:58:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('dee4d42c439b51b228ab5db5d0723fc0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-22 20:02:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('965c74ffe09d8a06bb817efa6d62254b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-23 10:01:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('059bac84373e9dae94363ea18802d70f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-23 10:06:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9ef3f1ed07003e3abec3445920b062f1', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-23 11:17:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0169622dcd4e89b177a0917778ac7f9c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-23 11:17:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f8960d64e93606fa52220cc9c4ae35a2', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-23 11:21:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4261867172d0fd5c04c993638661ac0b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-23 11:24:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('32464c6f7f772ddda0a963b19ad2fd70', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-23 11:30:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d29cf7aae44523bf2f3d187e91356fe8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-23 12:20:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0e9c0d0d26ddc652a7277912e0784d11', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-23 12:27:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('25f8b1b345b1c8a070fe81d715540c85', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-23 15:39:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8327cced60486bad4009276e14403502', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-24 09:56:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('515c28df59f07478339b61ca5b1b54a8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-24 10:34:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('fa0612372b332b6c3ce787d9ca6dd2cc', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-24 11:48:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8300e85a2c2f16c2358d31e8b364edf7', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-24 11:55:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3d9874f248a984608ca98c36c21c5a7a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-24 13:05:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('cc8ab347f332c55570830c5fc39bbf9f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-24 13:08:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8742a458bf166fd5f134ac65fa8903f9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-24 13:09:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('bbe2e637bafa0d7f465dc9e1266cff3d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-25 11:16:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b3474fc5aad9ec2f36ccbbf7bf864a69', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-25 11:17:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('260bb025d91b59d0135d635ef85eeb82', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-25 11:40:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1a5b71c9458c17f9bcb19a5747fd47dd', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-25 11:56:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e720278084b0d4316448ec59d4e3399d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-25 15:52:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f6646950c8465da1d1219b7a7a209fc2', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-25 19:14:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('36358cacfc5eb3ba7e85cfe156218b71', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-25 19:14:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ee2bb63c47c868d59a45503b3d2f34ea', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-25 19:16:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b0d11dfec52e02f504c63e2f8224b00d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-25 19:27:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4acfbc327681d89dab861c77401f8992', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-28 10:54:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('96ada57ac17c4477f4e4c8d596d4cc1a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-28 10:54:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e4e40e21437b23b74324e0402cceb71a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-28 11:34:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d92d9e003666c6b020f079eaee721f9f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-28 12:08:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('68f7394ca53c59438b2b41e7bb9f3094', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-28 14:09:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a9b34565c6460dc9cede00ad150393f9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-28 14:17:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('fa427f74dc6bd9cca3db478b5842f7f7', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-28 14:19:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8b66ec251e3107765768dbd0590eeb29', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-28 14:25:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e42a38382fce916909d6d09f66147006', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-28 14:28:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ed0bbe9047a7471ae1cdc1c2941eccb1', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-29 17:52:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('36fd54ce8bc1ee4aac9e3ea4bfdcd5a8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-29 18:49:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('40b3a9bee45b23548250936310b273f4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-30 14:42:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c9be887c9292153e39861c91243b7432', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-30 15:12:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e40823376fa8c0e74a4e760de695e824', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-30 15:36:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('993010965223b8e3a7a784409f7e377e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-30 15:50:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('aa47c8cf2a4f2de16f415b9d9d3dbf05', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-30 16:14:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4a0020835a71fc6dcaefd01968d21f81', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-30 18:46:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('fa9cebbb6af23d2830584b3aacd51e46', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-31 13:59:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('60a975067f02cf05e74fa7b71e8e862a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-31 14:31:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('fbb8834e9736bdd4b6d3baee895c4ca4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-01-31 18:05:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('623e4bc7c098f368abcc368227235caf', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-01 09:48:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9f31eedbe3f3c5c431b490d5fec0094c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-01 09:56:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b945fe8b63e0fc26d02c85466f36ebd9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-01 09:57:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('968d434c45aae64c9ad0e86d18238065', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-01 10:02:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('732a1015057fde25d81ee12a7fbf66b2', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-01 10:05:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d9a0bb9fe6d2c675aa84f9441c0bd8bb', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-11 10:56:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9c64406daa2b6e7ad1f6776789d61e43', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-11 10:56:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1912a44dd4a6ffa1636d2dde9c2f1ab7', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-11 11:01:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d19b6e77ab1b6d6aa58996a93918754c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-11 11:33:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('81f7a606359aff9f97f95c15ce8e7c69', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-11 11:33:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7da063020a42db99e0f3bb9500498828', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-11 13:45:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b6ee157afd006ceddc8c7558c251192e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-11 14:20:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('65ace1ae98891f48ab4121d9258e4f1e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-12 10:45:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e2af7674bb716a7c0b703c7c7e20b906', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-12 11:38:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('60d4f59974170c67826e64480533d793', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-12 13:25:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('775e987a2ca37edc4f21e022b265a84a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-12 13:36:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('dd6fbb9b6224c927c0923c16b9285525', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-12 13:37:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f3d371d6f71409ea2fe52405b725db4a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-12 13:38:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c33b4e0bbf998330e44fad65e9d0029e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-12 15:54:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('189842bf681338dc99dfa66d366a0e6f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-12 15:55:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e14cd21cf5eaad9ea3689730a824a50c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-12 16:12:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5cf2431447eab30fd3623e831033eea0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-12 19:17:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9bfe7312f2951503082a28c2cc966ce4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-13 10:24:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('da9a15efcf4e1e4f24647db7e2143238', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-13 11:19:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8317a81bce60a10afeb44af6ef6c807a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-13 11:27:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0a6eb1fa998b749012216542a2447ae7', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-13 11:29:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e5a9b045449136719d4c19c429c2dd56', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-13 13:08:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('aaf10eab9c2b6ed6af1d7a9ce844d146', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-13 13:08:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b4ccdfc1280e73439eb1ad183076675b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-13 14:10:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('018fe8d3f049a32fb8b541c893058713', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-13 15:17:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f3aab8f9dff7bf705aa29c6dcce49011', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-13 15:18:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('efa591832b375b4609a5890b0c6f3250', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-13 16:00:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2c6822927334eb0810b71465fd9c4945', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-13 16:02:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7289cf420ac87ea0538bde81435b1aaa', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-13 16:03:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('db8adca4aa7972fdc283be96d877efe0', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-13 16:04:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c5e541648bab341230c93377b4d4e262', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-13 16:05:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e261674e2640fe6d0a3cd86df631537d', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-13 16:05:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('406e79995e3340d052d85a74a5d40d1b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-13 16:23:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4de1ed55165f7086f1a425a26a2f56ec', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-13 16:26:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d8eed69045aae6cedbff402b4e35f495', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-13 18:22:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('bbf4fb593d6918cc767bb50c9b6c16c5', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-14 10:44:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('506ce2d73a038b6e491a35a6c74a7343', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-14 13:44:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4303dbb3e502f11a3c4078f899bb3070', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-14 17:28:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2de252a92b59ebfbf16860cc563e3865', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-14 22:04:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e4c330b381e2fbfde49f1d4dd43e68b7', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-14 22:22:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('22735c059b01949a87cb918f5ef3be76', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-14 22:41:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c5954beca75d6a0c014e2de3b621275a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-14 22:41:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('db8c89112bf4706fb558664dd741aa46', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-15 09:33:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('fa0ce422c12a565461eca56006052891', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-15 10:13:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a34ed4c6fef2b9f07a20e54ef4501b99', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-15 10:48:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b55cc05e8dd4279c0fa145833db19ba8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-15 11:37:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5c675eeb69795180eee2c1069efc114b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-15 12:59:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5dee273feb8dd12989b40c2c92ce8c4a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-15 13:42:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('994efef0ebca19292e14a39b385b0e21', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-15 16:22:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('fc22aaf9660e66558689a58dfa443074', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-15 16:30:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2c6ede513b83fbc23aaedb89dbfa868a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-15 18:03:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('13c1e763e9d624a69727a38b85411352', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-15 18:39:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('fadb32d678346ee4bab02997988ff3bc', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-15 22:55:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0aa792eadeae39a1ed2a98ea5d2f6d27', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-16 09:11:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0aa9272c0581e1d7f62b1293375b4574', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-16 17:26:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('81c9056ac38e6f881d60f3d41df1845e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-17 11:44:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('eb4536aa50a58985baf0a763a1ce2ebf', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-17 19:48:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f9062582881b42f6b139c313d8ab0463', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-17 20:47:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('22d8a2fbd53eafb21f6f62ae073c0fc1', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-17 22:28:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7bc7b1ff923dbb19fb0ecd800cd690bd', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-18 09:34:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('faea0dbfb7f86b571fed0dd270623831', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-18 14:12:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('063baad688535096d2ed906ae6f3a128', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-18 22:09:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('528baecc596a66eaadc8887bff911f55', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-19 10:08:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e540ca989819c54baefffbc3d05e8b58', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-19 10:10:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0643f3ad4394de9fb3c491080c6a7a03', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-19 10:18:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('eb0b8a7cdf77df133566d7bd5a5f1fc0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-19 11:02:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0913bb0e92715892c470cf538726dfbc', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-19 16:17:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5034aec34f0b79da510e66008dbf2fcc', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-19 16:18:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e4afd66ac249dde9c3bd9da50f9c2469', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-19 17:41:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('07132c1228b1c165f62ea35f4ff1cbe9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-19 18:15:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4f7f587bec68ed5bf9f68b0ccd76d62b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-19 21:01:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('12709e62742056aa4a57fa8c2c82d84a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 09:13:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('680b3e6e4768d80d6ea0ce8ba71bdd0e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 09:14:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a6e323785535592ee208aa7e53554644', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 09:15:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3a4a0e27d77aa8b624180e5fd5e4004e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 09:51:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b98b7ac9e890657aa86a900763afbe2a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 11:49:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d1eb2a8ebed28d34199c5fc4a1579c4c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 12:55:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('85949de2d54078e6b8f3df0a3c79c43d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 17:08:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('77579d78a903635cc4942882f568e9e5', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 17:13:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('679e12ba247575749e03aa8f67347ac6', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 17:14:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5c35117cbeb39428fcc2ddd90ce96a2b', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 17:18:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7225200c3cec4789af4f1da2c46b129d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 17:19:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('22ad9f87788506456c774801389d6a01', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 17:20:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('81c95e1c8805fa191753fc99ba54c3e9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 18:01:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7285730e2644f49def0937dc99bfbe3d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 18:07:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4922f2f1173a1edc11dfd11cb2a100ae', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 18:08:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e37cce529d0c98c47b4977d7ddf963c0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 18:17:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('66493cd0347eeb6ee2ef5ee923604683', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 18:29:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f04910792a74c563d057c4fcb345f963', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 18:30:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('210a01dcb34302eaed0d1e95820655d0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 18:30:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('48929ec94226d9ccff9fae4ff48e95e3', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 18:32:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d2ac19a709ea08f7259286df28efd635', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 18:35:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d8fd478e6ceb03a575719e1a54342333', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 18:43:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a35a476c303983701045507c9af3fa03', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-20 18:44:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7e41208e29d412d586fc39375628b0d0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-21 15:34:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1f33d11e1833ae497e3ef65a3f02dd5b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-21 19:51:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('dae0658783324c81fa6909b6e4a25a65', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-22 11:46:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a77d29673cfe97c9e03cfb879b934f62', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-22 12:41:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('baaf37e5937f938ac92856bc74cc2b86', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-22 13:48:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3f47afcdce94596494746ac34eebf13b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-22 13:59:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b99fc7c53d4e3edc0c618edc11d3a073', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-22 15:58:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('024a4c5ba78538d05373dac650b227d1', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-22 15:59:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('873f425879ef9ca7ced982acda19ea58', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-22 16:35:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1b05434820cbcb038028da9f5cda31bb', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-22 17:45:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5f314fc45492d7f90b74d1ca74d1d392', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-22 17:45:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('20751803c1e5b2d758b981ba22f61fcd', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-22 18:11:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('50e8de3e6b45f8625b8fd5590c9fd834', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-22 18:23:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('6737424e01b38f2273e9728bf39f3e37', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-22 19:43:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0473dedf4aa653b253b008dacff2937c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-24 13:04:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a95192071de908f37f4998af4c269bcb', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-24 14:26:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3569ada5c43a4022d3d13ac801aff40e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-24 14:50:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('562092eb81561ee0f63be5dd9367d298', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-24 22:20:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('131ccd390401b6e3894a37e4d1d195d3', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-24 22:26:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c12e3d7655a5a8b192bb9964a2a66946', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-24 22:35:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('6bc98b7dc91a3924f794202867367aca', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-24 22:50:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('002b7112a147edeb6149a891494577d0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-24 22:52:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('202344b08b69ad70754e6adaa777eae0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-24 22:54:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('eeb1f2e2c1b480e0bb62533848cbb176', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-24 22:55:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('94fe4465d779e0438cfe6f0cb1a1aa7e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-24 22:57:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d03aaee882d13b796db860cb95f27724', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-24 22:59:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1db82f78233c120c6ec7648ca1177986', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-24 23:07:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7dc448f04edf4b9655362ad1a1c58753', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-24 23:10:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('fce1553149aea9bfd93e089f387199c8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-24 23:11:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e713a89e753cbecf1e10247b2112c3f8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-24 23:14:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0a634ed086442afa7a5fc9aa000b898a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 10:10:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('bfa0766f53dbd3a0fe4043f57bd9bbee', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 10:35:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e3b531fa12e47ac19a2ab0c883dee595', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 10:40:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('18eafaeec588403245269a41732d1a74', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 10:45:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('99357d793f2507cfb7b270677b4fe56c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 10:46:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b38f42f4e15ee72e494bdf6f6feb0ae7', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 10:49:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('bfe758860662ae07a15598396a12cfaa', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 10:50:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('69a7a5b960d6aedda5c4bd8b877be0a8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 10:50:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4084f184160940a96e47d7be1fab4ea3', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 10:51:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1241cf8e9fd0e28478a07bf755f528c5', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 10:51:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e0da357be27d66de1c9e9b8ecb22f9f9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 10:51:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9f4960f89a10d7fdcf22d1ea46143fff', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 10:51:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ab8a71b7565d356d12e12c6730b0ceb0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 10:51:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('35fdedc363d9fe514b44095da40f170b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 10:51:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7126b35521cd0dba932e6f04b0dac88f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 10:52:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9bd6e11c5a2f0bb70215cfa097a4b29c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 10:57:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7e2edea80050d2e46aa2e8faef8e29ce', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:01:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('190eb7b4d493eb01b13c5b97916eeb13', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:09:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ea268ad02db29012b2f1bd3d4aea1419', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:10:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7dc498b45fbf25c59686d9dda0d3eb66', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:12:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('583d3aa445d408f4ecd19ee0a85514af', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:18:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9cea908c7a78dc77fdaed975819983bd', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:20:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d70329497664391dabc25effe7406c50', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:25:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0b9940fc5487026a3f16cade73efead5', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:28:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f21f9f700bf4f5bd9edda7a16ed338f8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:30:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f5c08b45885d248c422a5d406cd5f223', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:41:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e9a31bfc128b3f5ae01656916c605ddb', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:44:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('6baccd034e970c6f109791cff43bc327', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:46:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d2b516c5d834bd0fca91cda416fe499e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:46:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f9abb524e0dc3571571dc6e50ec6db75', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:47:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d1111594fef195980370c5f91ccf9212', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:48:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9174fe77fe8ba69243f72d5577b391d3', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:48:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2ab9cf95ac35fdbb8fe976e13c404c41', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:49:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9be945480d69038865279f02df5cee45', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:49:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c2bfe3b92e6bfb7016cc82e95419a602', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 11:54:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7c310b99a84411798a2aaf4074a28e7e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 12:42:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b23293288a84ba965509f466ed0e7e2f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 12:43:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('cf590576a5f6a42b347e6b5bf5ebf5bd', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 12:43:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b5df1807f08af5db640da11affec24d3', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 12:49:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2746af3dd0309cdeeff7d27999fbcda1', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 12:52:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2a383edf5445dc8493f5240144ca72f5', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 12:56:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d2910961a0ff046cc3ef6cf8d33a8094', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 15:38:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('00f763e007e5a6bddf4cb8e562a53005', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 15:41:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8ab131214232450ca202103ef81f0a2d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 15:46:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('606cb4f81f9bb412e2b2bdaa0f3e5dda', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 16:27:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7b85fba62bc001773fff1a54e1609aef', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 16:28:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b3127e34f395e1f1790450da5689a4a1', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 16:28:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('fb2871cda1421b766f8e68cb36a22bf3', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 17:35:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('29fb5d4297748af3cd1c7f2611b7a2d6', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 17:38:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('580256f7c7ea658786dba919009451b6', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 17:39:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8802209912ca66d56f2ea241ffd0cc13', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 17:52:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4778fe2992fd5efd65f86cb0e00e338e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 17:53:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d68957c067fb27e80a23babebdb1591f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 17:55:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('472c34745b8f86a46efa28f408465a63', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 17:56:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('26975f09c66025d1c8d87a6894a3c262', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 18:29:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e4a166fcd0fc4037cb26e35cc1fb87b2', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 18:32:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('286af82485388bfcd3bb9821ff1a4727', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 18:34:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('eaf74cd1489b02d39c470eed131fc918', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 18:37:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e48a6bd82c92a8005c80c5ef36746117', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 19:32:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('10922e0d030960e6b026c67c6179247b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-25 20:07:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b53c9e8ce1e129a09a3cda8c01fe644c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 11:38:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('65be8e015c9f2c493bd0a4e405dd8221', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 11:40:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8ff27392165c8c707ee10ec0010c7bb8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 11:44:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('337b647a4085e48f61c7832e6527517d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 11:45:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('caee69e55ec929f7ba904280cac971e6', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 11:49:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('bdeae62057ae9858b6a546c1bdb6efc7', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 11:49:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ea66ed22fde49640cee5d73c6ef69718', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 11:50:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('47c5a5b799e10255c96ccd65286541ef', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 11:50:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('cfba34db2d7fbb15a2971212f09b59ec', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 11:51:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('faad055dd212ed9506b444f8f1a920b9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 12:00:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ef7219725c4b84cc71f56f97a8eab01a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 12:08:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2811e224e4e8d70f2946c815988b9b7c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 12:08:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7feae2fb5001ca0095c05a8b08270317', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 12:17:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b4c3c7af9899b9af3f42f730cfabc9b2', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 12:17:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('28e8a7ed786eaced3182c70f68c7ea78', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 12:18:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3a76114e431912ff9a19a4b6eb795112', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 12:19:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('557b3c346d9bc8f7a83fac9f5b12dc1b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 12:20:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e92544c6102243e7908e0cbb217f5198', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 12:48:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('61445cc950f5d04d91339089b18edef9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 14:13:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('776c2e546c9ab0375d97590b048b8a9d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 14:13:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ef7669ac0350730d198f59b8411b19d1', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 14:28:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b3cceb535fa5577cc21b12502535ad29', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 14:29:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('18a51a5f04eeaad6530665f6b0883f0c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 14:34:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8a13971104d70e35111d10dd99de392e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 14:34:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('6d93d5667245ef8e5d6eafdbc9113f51', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 14:34:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7ba3df5d2612ac3dd724e07a55411386', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 14:35:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7148b3d58f121ef04bcbea5dd2e5fe3b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 14:35:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('709b0f2bf8cb8f785f883509e54ace28', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 14:37:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4114145795da30b34545e9e39b7822d9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 14:39:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f543c25bdd741055aeb4f77c5b5acf58', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 14:40:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('bc594b8921a0bcdb26d4a93916316092', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 14:42:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('11f511eeeb2e91af86b9d5e05132fc89', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 15:13:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('810deb9fd39fa2f0a8e30e3db42f7c2b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 18:51:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d5b9e5d9bfbbd8e6d651087ead76d9f7', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 20:17:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('016510fc662d9bb24d0186c5478df268', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-02-26 20:27:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('eb6f5196de91dd2e8316696bddd61345', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 22:26:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d762a1cba3dc23068f352323d98909e0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-02-26 22:26:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('69fc2407b46abad64fa44482c0dca59f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-01 12:04:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0d6cd835072c83f46d1d2a3cf13225d3', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-01 12:04:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e78f8832d61c1603c17767ee2b78ef07', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-01 19:50:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0475b4445d5f58f29212258c1644f339', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-01 20:20:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2b5a76869a7d1900487cd220de378dba', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-05 16:32:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('21b8493a05050584d9bb06cfc2a05a6b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-05 17:29:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a61d9db83888d42b0d24621de48a880d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-05 22:49:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('097be3e8fdf77a245f5c85884e97b88c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-05 22:52:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7b2b322a47e1ce131d71c50b46d7d29e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-06 15:55:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('cedf399271592c27dcb6f6ce3312e77d', 2, '删除测试DEMO', NULL, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.delete()', NULL, '[\"7501\"]', NULL, 24, 'admin', '2019-03-06 16:03:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('efe77038e00cfff98d6931c3e7a4c3d6', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-06 16:20:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ffac84fff3c65bb17aa1bda3a0d2029e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-06 20:10:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('45819fe1b96af820575a12e9f973014e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-07 09:19:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('87885bc889d23c7c208614da8e021fb0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-07 10:23:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('54c2bad38dafd9e636ce992aa93b26af', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-07 11:57:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d3c4f120d8a23b62ec9e24b431a58496', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-07 14:17:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d01d658731dac4b580a879d986b03456', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-07 15:00:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ab550d09101a88bc999ea57cbb05aa5a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-07 17:59:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('aeb738ab880c262772453d35fc98f2f2', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-07 18:50:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('375aadb2833e57a0d5a2ce0546a65ca4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-07 20:38:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('96d7fe922f46123e0497e22dedf89328', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-07 23:10:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('636d37d423199e15b4030f35c60859fe', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-08 10:07:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a7d1f4a774eb8644e2b1d37ca5f93641', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-08 10:16:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('017e9596f489951f1cc7d978085adc00', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-08 10:58:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0b42292a532c796495a34d8d9c633afa', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-08 12:58:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b428718441be738cf8b5ce92109068c3', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-08 16:21:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('89d2bc84e056f327291c53821d421034', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-08 16:57:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e09bb0a74c268a9aaf1f94edcc2eb65a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-08 18:26:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0dc22e52c9173e4e880728bc7734ff65', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-09 11:14:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5358b182eab53a79eec236a9cee1e0fc', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-09 13:01:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('23176e4b29c3d2f3abadd99ebeffa347', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-09 16:37:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('703fbcb7e198e8e64978ec0518971420', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-09 17:53:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9e9d01c430b72703ce3a94589be54bbe', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-09 18:26:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ef54197116da89bf091c0ed58321eea4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-09 19:22:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('111156480d4d18ebf40427083f25830f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.1.104', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-09 19:48:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a9bd713f975bfbff87638432a104b715', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.1.104', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-09 20:04:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('06fbb85b34f518cd211b948552de72f8', 1, '登录失败，用户名:null不存在！', NULL, NULL, NULL, '192.168.1.104', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-09 20:08:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9b568a868e57f24c5ba146848061613f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.1.104', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-09 20:09:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('02026841bf8a9204db2c500c86a4a9be', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.1.104', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-09 20:44:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c1a68605bee6b3d1264390c1cfe7a9fa', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-09 20:49:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('cbd720f20fc090c7350a98be0738816a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.1.104', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-09 20:55:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2676be4ffc66f83221fd95e23d494827', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.1.104', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-09 21:31:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e9d3202c14f7f2812346fb4c2b781c67', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.1.104', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-09 21:38:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d9e0150666b69cced93eb4defb19788b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-09 23:11:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1f0b36f7e021aa5d059ffb0a74ef6de4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-09 23:11:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('326b2df4ab05a8dbb03a0a0087e82a25', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-10 11:53:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7ae9cad197aee3d50e93bc3a242d68ec', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-10 13:12:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('78caf9e97aedfb8c7feef0fc8fdb4fb5', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-10 17:04:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d00964eee24c6f9a8609a42eeebef957', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-10 17:04:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('04f97d7f906c1e97384a94f3728606a4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-11 12:08:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2b433e88db411bef115bc9357ba6a78b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.1.105', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-11 12:09:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('63ccf8dda5d9bf825ecdbfb9ff9f456c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.1.105', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-11 12:14:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('404d5fb6cce1001c3553a69089a618c8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-11 12:29:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9ed114408a130e69c0de4c91b2d6bf7e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-11 13:03:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2eb964935df6f3a4d2f3af6ac5f2ded1', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.1.200', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-11 13:27:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e864c0007983211026d6987bd0cd4dc8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.1.114', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-11 13:37:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8b2ad448021fbb5509ea04c9a780b165', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.1.104', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-11 14:35:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('69a9dfb2fb02e4537b86c9c5c05184ae', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.1.104', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-11 15:22:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('98b7fc431e4654f403e27ec9af845c7b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-11 17:31:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('42bf42af90d4df949ad0a6cd1b39805e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.1.200', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-11 17:39:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e234abc35a52f0dd2512b0ce2ea0e4f2', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-11 20:05:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('69baa4f883fe881f401ea063ddfd0079', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-12 20:51:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a867c282a8d97f7758235f881804bb48', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-13 18:28:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1aa593c64062f0137c0691eabac07521', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-14 10:45:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('de978382f59685babf3684d1c090d136', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-14 12:55:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('75c7fa1a7d3639be1b112e263561e43a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-14 17:07:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7a9d307d22fb2301d6a9396094afc82f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-14 18:45:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('28dbc8d16f98fb4b1f481462fcaba48b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-14 20:56:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f1186792c6584729a0f6da4432d951f9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-14 21:45:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4f31f3ebaf5d1a159d2bb11dd9984909', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-15 11:14:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9a5c1fbf3543880af6461182e24b75db', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-15 13:51:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b86958d773b2c2bd79baa2e8c3c84050', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-15 16:49:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a052befb699ee69b3197b139fd9263f0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-15 17:34:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('6836a652dc96246c028577e510695c6f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-15 20:47:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8fe913a5b037943c6667ee4908f88bea', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-16 11:18:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9410b7974fbc9df415867095b210e572', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-16 11:18:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('98d4b573769af6d9c10cd5c509bfb7af', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-16 11:21:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('18b16a451fec0fe7bf491ab348c65e30', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-16 11:55:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0d85728028ed67da696137c0e82ab2f6', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-16 12:58:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4aa770f37a7de0039ba0f720c5246486', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-17 17:26:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2fecb508d344c5b3a40f471d7b110f14', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-17 17:36:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('61aac4cfe67ec6437cd901f95fbd6f45', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-17 17:40:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('62e208389a400e37250cfa51c204bdc8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-17 17:44:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('eb9a522fd947c7a706c5a106ca32b8c9', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-17 17:50:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('bd9167a87aee4574a30d67825acaad0a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-17 17:51:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('49f1ec54eb16af2001ff6809a089e940', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-17 17:59:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('bdfd95b4d4c271d7d8d38f89f4a55da9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-17 17:59:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('95063e0bdfa5c9817cc0f66e96baad93', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-17 17:59:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('30da94dd068a5a57f3cece2ca5ac1a25', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-17 18:01:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8fde5f89e8ad30cf3811b8683a9a77b1', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-17 18:02:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2ebe7f0432f01788d69d39bc6df04a1a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-17 18:05:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('beb9ef68b586f05bd7cf43058e01ad4a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-17 22:29:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('befbcf5a27ef8d2ca8e6234077f9413d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-18 16:01:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('378b44af9c1042c1438450b11c707fcf', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-18 16:07:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0571e5730ee624d0dd1b095ad7101738', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-18 16:10:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3ec2023daa4a7d6a542bf28b11acf586', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-18 16:18:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('64c00f27ddc93fda22f91b38d2b828b5', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-18 17:34:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('21bad1470a40da8336294ca7330f443d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-18 17:35:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('72ee87d0637fb3365fdff9ccbf286c4a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-18 17:36:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d8c43edd685431ab3ef7b867efc29214', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-18 17:37:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0ad51ba59da2c8763a4e6ed6e0a292b2', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-18 17:37:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d916bd1d956418e569549ee1c7220576', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-18 19:18:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('917dbb5db85d1a6f142135827e259bbf', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-18 20:21:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('db2b518e7086a0561f936d327a0ab522', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-18 22:39:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('61d2d2fd3e9e23f67c23b893a1ae1e72', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-18 22:44:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('671a44fd91bf267549d407e0c2a680ee', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-18 22:45:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('586e8244eff6d6761077ef15ab9a82d9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-18 23:03:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2b4d33d9be98e1e4cdd408a55f731050', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-19 10:32:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3267222d9387284b864792531b450bfe', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-19 10:33:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a28de45f52c027a3348a557efab6f430', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-19 10:34:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9db7e7d214dbe9fe8fff5ff20634e282', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-19 11:19:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('74209dfc97285eb7919868545fc2c649', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-19 11:23:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('49d48fda33126595f6936a5d64e47af0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-19 13:17:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('fe0dc06eaef69047131f39052fcce5c4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-19 13:56:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f540eff3f6e86c1e0beccd300efd357f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-19 15:15:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3fd0d771bbdd34fae8b48690ddd57799', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-19 17:17:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('27e8812c9a16889f14935eecacf188eb', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-19 18:52:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('88bab180edf685549c7344ec8db7d954', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-19 19:07:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ed9b4ffc8afab10732aac2d0f84c567b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-19 19:10:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ad97829fe7fefcd38c80d1eb1328e40f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 09:28:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3d25a4cdd75b9c4c137394ce68e67154', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 09:59:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5c7e834e089ef86555d8c2627b1b29b5', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 11:25:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b3adf055f54878657611ef430f85803e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 11:33:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8d105ea6c89691bc8ee7d4fd568aa690', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 11:39:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('445436e800d306ec1d7763c0fe28ad38', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 11:43:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7f9c3d539030049a39756208670be394', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 11:44:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('feaf7c377abc5824c1757d280dd3c164', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 11:58:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c72bb25acd132303788699834ae039b4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 12:06:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e4c06405615399d6b1ebea45c8112b4d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 12:07:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f95d517f43ba2229c80c14c1883a4ee9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 12:11:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d18bff297a5c2fa54d708f25a7d790d6', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 12:13:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b5f6636c6e24e559ddf1feb3e1a77fd5', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 12:14:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('aeca30df24ce26f008a7e2101f7c513c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 12:27:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('cd7a7c49e02ca9613b6879fda4e563cf', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 12:29:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a7ee4b4c236bc0e8f56db5fdf1e5ac38', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 13:21:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('6d45672f99bbfd01d6385153e9c3ad91', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 13:49:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('905d2cf4308f70a3a2121a3476e38ed0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 14:00:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('27d23027dc320175d22391d06f50082f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 15:50:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('52fde989fb8bb78d03fb9c14242f5613', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-03-20 17:04:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('952947331f8f3379494c4742be797fc3', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-20 18:42:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('39caf3d5d308001aeb0a18e15ae480b9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 10:31:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('772f238d46531a75fff31bae5841057c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 11:31:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f79af48e6aeb150432640483f3bb7f2a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:09:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('20fc3263762c80ab9268ddd3d4b06500', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:36:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e8b37ad67ef15925352a4ac3342cef07', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:38:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d6aaf0f8e2428bf3c957becbf4bcedb4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:38:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3bc73699a9fd3245b87336787422729b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:41:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('862aa0e6e101a794715174eef96f7847', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:41:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a6209166e1e9b224cca09de1e9ea1ed7', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:41:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b954f7c34dfbe9f6a1fc12244e0a7d59', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:41:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('64711edfb8c4eb24517d86baca005c96', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:41:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0efc9df0d52c65ec318e7b46db21655f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:42:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c03985d6e038b5d8ebdeec27fce249ba', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:43:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('69e6fd7891d4b42b0cccdc0874a43752', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:45:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9b23981621d5265a55681883ec19fa91', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:46:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('37ca8ff7098b9d118adb0a586bdc0d13', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:46:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ea5f9191b0f593a1d6cb585538caa815', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:46:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8e03def9e0283005161d062d4c0a5a80', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:46:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f78e24f5e841acac2a720f46f6c554bc', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:47:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f93279c6899dc5e6cec975906f8bf811', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:47:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('cd5af66a87bb40026c72a748155b47e8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:47:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5902fb4ba61ccf7ff4d2dd97072b7e5b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:48:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e1d1fc464cf48ec26b7412585bdded1a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 13:49:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5ea258e1f478d27e0879e2f4bcb89ecd', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 14:01:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2e44c368eda5a7f7a23305b61d82cddb', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 18:14:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('34a6b86424857a63159f0e8254e238c2', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 18:22:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ffc6178ffa099bb90b9a4d0a64dae42b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 18:28:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3612f8d40add5a7754ea3d54de0b5f20', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 19:59:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7a511b225189342b778647db3db385cd', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 20:50:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b7085f003b4336af4d4ba18147f8e5ae', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 22:29:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c66e22782dd3916d1361c76b0cc4ec8a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-21 22:44:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c6cbe54fcb194d025a081e5f91a7e3f0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-22 10:26:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1ab7c74d217152081f4fa59e4a56cc7b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-22 12:03:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5f00b5514a11cd2fe240c131e9ddd136', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-22 16:30:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('82cee1c403025fc1db514c60fc7d8d29', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-22 16:41:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('af5869701738a6f4c2c58fe8dfe02726', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-22 16:42:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('233e39d8b7aa90459ebef23587c25448', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-22 17:38:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b0cebd174565a88bb850a2475ce14625', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-22 18:19:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('26529d5753ceebbd0d774542ec83a43e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-22 20:17:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f3e1f7fb81004ccd64df12d94ef1e695', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-22 21:30:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a2e0435673b17f4fb848eecdf8ecacd6', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-22 21:32:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5323f848cddbb80ba4f0d19c0580eba9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-22 22:58:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5858f2f8436460a94a517904c0bfcacb', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-22 23:42:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8d9ce65020320d46882be43b22b12a62', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-23 10:56:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('11802c7a3644af411bc4e085553cfd4f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-23 14:46:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('fc69a1640a4772c8edf2548d053fa6de', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-03-23 14:55:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e3031f999984909f9048d8ec15543ad0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-23 18:43:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f43e38800d779422c75075448af738d1', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-23 18:47:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('dcfe23b155d5c6fa9a302c063b19451e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-23 18:47:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('802cec0efbe9d862b7cea29fefc5448b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-23 18:58:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f58e160e97d13a851f59b70bf54e0d06', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-23 20:11:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b8bd2a9de3fb917dfb6b435e58389901', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-23 20:13:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e01ed1516e8ae3a2180acbd4e4508fa5', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-23 20:28:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b7f33b5a514045878447fc64636ac3e6', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-23 22:00:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d0ce9bfc790a573d48d49d3bbbf1a1cb', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-23 22:09:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('74c991568d8bcb2049a0dbff53f72875', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-23 22:12:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0251bbee51c28f83459f4a57eeb61777', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-23 22:14:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a5848ab4e8d0fb6ecf71ee1d99165468', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-23 22:14:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('79a1737fcc199c8262f344e48afb000d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-23 23:25:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('6cfeaf6a6be5bb993b9578667999c354', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-24 11:43:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c5d4597b38275dcb890c6568a7c113f2', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-24 12:18:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0f173ec7e8819358819aa14aafc724c0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 11:15:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ce9893f4d0dd163e900fcd537f2c292d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 11:55:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('90711ddb861e28bd8774631c98f3edb9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 11:57:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('fb73d58bf6503270025972f99e50335d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 11:57:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3a290289b4b30a1caaac2d03ad3161cd', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 11:58:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('716f9f5f066a6f75a58b7b05f2f7f861', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 11:59:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('151a9f1b01e4e749124d274313cd138c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 11:59:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0ef3e7ae8c073a7e3bdd736068f86c84', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:02:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d7e7cb4c21372e48b8e0ec7e679466e3', 1, '用户名: null,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:02:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('15b9599cb02b49a62fb4a1a71ccebc18', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:02:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ecfee5b948602a274093b8890e5e7f3f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:05:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('cbf83d11486a8d57814ae38c9822b022', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:05:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f2ce8024e62740f63c134c3cfb3cae23', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:07:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c665d704539483630cc9ed5715ed57a8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:10:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e93f1a170e3cd33f90dd132540c7a39b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:12:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('fded8eb5d78d13791baec769019fee54', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:15:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('03ec66b6b6d17c007ec2f918efe5b898', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:16:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5e8bac7831de49146d568c9a8477ddad', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:16:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('cd064a2f6cb6c640cb97a74aaa6041d7', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:17:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a521d9f2a0087daa37923fa704dea85b', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-03-25 12:45:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4816854636129e31c2a5f9d38af842ef', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-03-25 12:45:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('90b4bad7939233a1e0d7935f079ea0fa', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-03-25 12:45:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('aec0817ecc0063bde76c1f6b6889d117', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:47:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e169938510c9320cb1495ddb9aabb9d1', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:47:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b7478d917ab6f663e03d458f0bb022a3', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:50:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('642e48f2e5ac8fe64f1bfacf4d234dc8', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-03-25 12:51:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ed2740de487c684be9fa3cf72113ae30', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:51:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b1e9797721dbfcc51bbe7182142cbdcd', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-03-25 12:52:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('6a67bf2ff924548dee04aa97e1d64d38', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:52:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a56661bbc72b8586778513c71f4764f5', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:53:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ae61be664d2f30d4f2248347c5998a45', 1, '用户名: jeecg,退出成功！', NULL, 'jeecg', 'jeecg', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-03-25 12:53:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4ab79469ba556fa890258a532623d1dc', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:54:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3a0330033a8d3b51ffbfb2e0a7db9bba', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:54:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b972484d206b36420efac466fae1c53f', 1, '用户名: jeecg,退出成功！', NULL, 'jeecg', 'jeecg', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-03-25 12:54:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7e92abdc0c1f54596df499a5a2d11683', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 12:59:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('fa9b4d7d42bc9d1ba058455b4afedbfb', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-03-25 12:59:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1d970c0e396ffc869e3a723d51f88b46', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 13:01:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('88d7136ed5c7630057451816dbaff183', 1, '用户名: jeecg,退出成功！', NULL, 'jeecg', 'jeecg', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-03-25 13:01:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('48eac0dd1c11fe8f0cb49f1bd14529c2', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 13:01:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a8c7ba2d11315b171940def2cbeb0e8f', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-03-25 13:01:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('20fea778f4e1ac5c01b5a5a58e3805be', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 19:01:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('48e5faf2d21ead650422dc2eaf1bb6c5', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 22:08:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f74f759b43afa639fd1c4f215c984ae0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-25 22:08:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d82b170459d99fc05eb8aa1774e1a1c9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-26 18:45:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e088a2607864d3e6aadf239874d51756', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-26 18:46:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('95d906e6f048c3e71ddbcc0c9448cf49', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-26 19:23:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3767186b722b7fefd465e147d3170ad1', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-26 21:57:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f21e30d73c337ea913849ed65808525c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-27 10:23:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('189e3428e35e27dfe92ece2848b10ba8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-27 15:52:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e2b6d0e751f130d35c0c3b8c6bd2a77e', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-03-27 16:18:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('586002e1fb4e60902735070bab48afe3', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-27 16:18:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('611fa74c70bd5a7a8af376464a2133e8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-27 17:48:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('90555a39c0b02180df74752e4d33f253', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-27 18:26:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('217aa2f713b0903e6be699136e374012', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-27 20:07:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5554869b3475770046602061775e0e57', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-28 14:38:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('bfec8c8c88868391041667d924e3af7f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-28 14:38:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('675153568c479d8b7c6fe63327066c9f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-28 15:29:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4930e32672465979adbc592e116226a6', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-28 16:53:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9a1456ef58a2b1fb63cdc54b723f2539', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-28 17:26:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('484cdb8db40e3f76ef686552f57d8099', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-28 18:14:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('02d4447c9d97ac4fc1c3a9a4c789c2a8', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-03-28 18:24:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('59558082e1b1d754fa3def125ed4db3c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-28 18:24:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c434dc5172dc993ee7cd96187ca58653', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-03-28 19:46:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a6261bbbf8e964324935722ea1384a5d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-28 19:46:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f0748a25728348591c7b73a66f273457', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-03-28 19:46:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('14f447d9b60725cc86b3100a5cb20b75', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-28 19:46:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7c88e9cf6018a1b97b420b8cb6122815', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-03-28 19:46:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('cb7c6178101ef049d3f1820ee41df539', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-28 19:59:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('21fed0f2d080e04cf0901436721a77a6', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-28 21:53:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4ba055970859a6f1afcc01227cb82a2d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-29 09:43:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3ba1e54aa9aa760b59dfe1d1259459bc', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-29 09:44:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7b44138c1b80b67da13b89db756a22b0', 2, '添加测试DEMO', NULL, NULL, NULL, '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.add()', NULL, '[{\"createBy\":\"jeecg-boot\",\"createTime\":1553824172062,\"id\":\"5fce01cb7f0457746c97d8ca05628f81\",\"name\":\"1212\"}]', NULL, 25, 'jeecg-boot', '2019-03-29 09:49:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d7e8a7f14967c70d68f5569cb4d11d0a', 2, '删除测试DEMO', NULL, NULL, NULL, '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.delete()', NULL, '[\"5fce01cb7f0457746c97d8ca05628f81\"]', NULL, 9, 'jeecg-boot', '2019-03-29 09:49:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e7f2b0a7493e7858c5db1f1595fa54b1', 2, '添加测试DEMO', NULL, NULL, NULL, '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.add()', NULL, '[{\"createBy\":\"jeecg-boot\",\"createTime\":1553824376817,\"id\":\"e771211b77cd3b326d3e61edfd9a5a19\",\"keyWord\":\"222\",\"name\":\"222\"}]', NULL, 7, 'jeecg-boot', '2019-03-29 09:52:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('997bb4cb1ad24439b6f7656222af0710', 2, '添加测试DEMO', NULL, NULL, NULL, '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.add()', NULL, '[{\"createBy\":\"jeecg-boot\",\"createTime\":1553824768819,\"id\":\"ee84471f0dff5ae88c45e852bfa0280f\",\"keyWord\":\"22\",\"name\":\"222\"}]', NULL, 5, 'jeecg-boot', '2019-03-29 09:59:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a6c3b28530416dace21371abe8cae00b', 2, '删除测试DEMO', NULL, NULL, NULL, '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.delete()', NULL, '[\"ee84471f0dff5ae88c45e852bfa0280f\"]', NULL, 9, 'jeecg-boot', '2019-03-29 09:59:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d2fe98d661f1651b639bf74499f124db', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-29 10:16:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2186244ae450e83d1487aa01fbeae664', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-29 14:47:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a5daa58b078cb8b3653af869aeecebd0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-29 17:14:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f29f3b7b7e14b1389a0c53d263c0b26b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-29 17:44:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2659c59136fb1a284ab0642361b10cdd', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-29 18:40:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a42e5cd05566ea226c2e2fc201860f2c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-30 11:15:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f06048c147c5bcdbed672e32b2c86b1c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-30 14:07:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('13c83c56a0de8a702aeb2aa0c330e42c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-30 14:53:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ab1d707bbfdf44aa17307d30ca872403', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-30 15:50:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5d8ed15778aa7d99224ee62c606589fb', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-03-30 15:51:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('42aef93749cc6222d5debe3fb31ba41b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-30 15:51:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5c04e3d9429e3bcff4d55f6205c4aa83', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-30 18:14:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('af8fe96a9f0b325e4833fc0d9c4721bf', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-03-30 18:14:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('21910e350c9083e107d39ff4278f51d6', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-30 18:14:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('636309eec5e750bc94ce06fb98526fb2', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-03-30 18:15:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9d0416e09fae7aeeeefc8511a61650c2', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-30 18:15:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2e63fd1b3b6a6145bc04b2a1df18d2f5', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-30 19:01:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2966ed2bdf67c9f3306b058d13bef301', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-30 21:25:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3683743d1936d06f3aaa03d6470e5178', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-30 22:40:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0ba24c5f61ff53f93134cf932dd486db', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-31 21:06:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('bbd3e1f27e025502a67cf54945b0b269', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-03-31 22:13:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1f8f46118336b2cacf854c1abf8ae144', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-01 11:02:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ac8cf22c2f10a38c7a631fc590551c40', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-01 12:04:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7d11535270734de80bd52ec0daa4fc1f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.1.105', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-01 12:20:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('6b4cdd499885ccba43b40f10abf64a78', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-01 13:04:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('77a329e5eb85754075165b06b7d877fd', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-01 13:25:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0e754ee377033067f7b2f10b56b8784c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-01 17:17:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9b7a830914668881335da1b0ce2274b1', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-01 17:19:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a1b870eee811cfa4960f577b667b0973', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-01 18:23:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('85b3106d757d136b48172a9ab1f35bb6', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-01 18:34:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7f31435ca2f5a4ef998a4152b2433dec', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-01 18:36:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f20cf3fe228ba6196a48015b98d0d354', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-01 19:25:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('65771bce3f5786dfb4d84570df61a47a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-01 22:07:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c98a6367b152cf5311d0eec98fab390c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-01 22:13:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('93b4d26f60d7fb45a60524760bf053e4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-01 22:20:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3087ac4988a961fa1ec0b4713615c719', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-01 22:54:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a69f4ff4e48754de96ae6fa4fabc1579', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 09:18:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a63147887c6ca54ce31f6c9e6279a714', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 09:19:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a2950ae3b86f786a6a6c1ce996823b53', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-02 09:47:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('615625178b01fc20c60184cd28e64a70', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 09:47:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('89fbc93e77defb34c609c84a7fe83039', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-02 09:47:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('432067d777447423f1ce3db11a273f6f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 09:47:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7d8539ff876aad698fba235a1c467fb8', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-02 09:47:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('689b8f2110f99c52e18268cbaf05bbb6', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 09:58:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2919d2f18db064978a619707bde4d613', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-02 09:58:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0dc6d04b99e76ad400eef1ded2d3d97c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 09:59:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('45f0309632984f5f7c70b3d40dbafe8b', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-02 09:59:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d869534109332e770c70fad65ef37998', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 10:02:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c21422fa08f8480a53367fda7ddddf12', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-02 10:02:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1e4533a02fb9c739a3555fa7be6e7899', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 10:04:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('03c0ab177bd7d840b778713b37daf86f', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-02 10:04:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('60886d5de8a18935824faf8b0bed489e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 10:11:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4218b30015501ee966548c139c14f43f', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-02 10:11:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('de938485a45097d1bf3fa311d0216ed4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 10:15:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e1d0b1fd3be59e465b740e32346e85b0', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-02 10:16:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4234117751af62ac87343cbf8a6f1e0f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 10:17:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('845f732f6a0f0d575debc4103e92bea2', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-02 10:17:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('cc39057ae0a8a996fb0b3a8ad5b8f341', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 10:20:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('155d2991204d541388d837d1457e56ab', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 11:32:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2312c2693d6b50ca06799fee0ad2554a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 12:11:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d98115c02c0ac478a16d6c35de35053d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 12:50:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('55e906361eeabb6ec16d66c7196a06f0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 12:50:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3836dc3f91d072e838092bc8d3143906', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 12:50:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('add13f513772a63f8ca8bf85634bb72c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 13:09:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a6971e63e3d9158020e0186cda81467d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 14:59:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2eb75cb6ca5bc60241e01fa7471c0ccf', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 18:34:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3e69108be63179550afe424330a8a9e4', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-02 18:38:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('6c558d70dc5794f9f473d8826485727a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 18:38:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('687810e7fea7e480962c58db515a5e1c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 18:42:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d23e6766cecf911fb2e593eeee354e18', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 18:42:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0819ea9729ddf70f64ace59370a62cf1', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 18:59:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('939b3ff4733247a47efe1352157b1f27', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 19:01:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('6cf638853ef5384bf81ed84572a6445d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-02 19:25:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('bc28d4275c7c7fcd067e1aef40ec1dd4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-03 10:53:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('43536edd8aa99f9b120872e2c768206c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-03 10:53:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7268539fbe77c5cc572fb46d71d838f1', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-03 13:22:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f0409312093beb563ac4016f2b2c6dfd', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-03 13:24:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a710ed2de7e31fd72b1efb1b54ba5a87', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-03 15:30:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b01c3f89bcfd263de7cb1a9b0210a7af', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-03 17:53:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e1fa52ecbcc0970622cc5a0c06de9317', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-03 18:33:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('790b722fa99a8f3a0bc38f61e13c1cf4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-03 18:34:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('20e5887d0c9c7981159fe91a51961141', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-03 20:12:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ce6aa822166b97a78b0bbea62366f8e0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-03 20:14:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3e6116220fa8d4808175738c6de51b12', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-03 21:04:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('10a434c326e39b1d046defddc8c57f4a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-03 21:18:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('317e3ae1b6ccdfb5db6940789e12d300', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-03 21:44:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2b801129457c05d23653ecaca88f1711', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-03 21:44:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7a99cf653439ca82ac3b0d189ddaad4a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-04 10:41:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('68e90e08a866de748e9901e923406959', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-04 12:37:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2942a12521ac8e3d441429e6c4b04207', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-04 14:12:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('dfacaa7c01ccf0bade680044cced3f11', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-04 15:25:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f3cafb545e5693e446f641fa0b5ac8cd', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-04 17:07:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('060d541a9571ca2b0d24790a98d170a6', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-04 19:28:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9df97c1b3213aa64eda81c6bf818b02b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-04 22:42:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('43079866b75ee6a031835795bb681e16', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-04 22:44:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('55d649432efa7eaecd750b4b6b883f83', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-04 22:44:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ca737885d9034f71f70c4ae7986fafa8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-04 22:47:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1534f0c50e67c5682e91af5160a67a80', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-04 22:47:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('93bb98ba996dacebfb4f61503067352e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-04 22:47:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5c48703e3a2d4f81ee5227f0e2245990', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-04 23:12:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('70849167f54fd50d8906647176d90fdf', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-04 23:12:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('310bb368795f4985ed4eada030a435a0', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-04 23:22:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('477592ab95cd219a2ccad79de2f69f51', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-05 10:38:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e39f051ba6fdb7447f975421f3b090a7', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-05 12:49:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('4d1be4b4991a5c2d4d17d0275e4209cf', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-05 20:47:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9eb3fb6d9d45e3847a88f65ed47da935', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '192.168.3.22', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-05 20:52:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('6664dc299f547f6702f93e2358810cc1', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.3.22', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-05 21:04:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9c32ec437d8f8d407b1bd1165fc0305d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-08 15:01:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('68df65639e82cc6a889282fbef53afbb', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-08 15:01:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('79e76353faffd0beb0544c0aede8564f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-08 17:28:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('da3fda67aea2e565574ec2bcfab5b750', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-08 22:36:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('de37620b6921abcfe642606a0358d30f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-09 15:42:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b0e6b3a0ec5d8c73166fb8129d21a834', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-09 16:56:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('01075aa535274735e0df0a8bc44f62f9', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-09 16:56:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('01ebe1cbeae916a9228770f63130fdac', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-09 16:56:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('baa53d6a534e669f6150ea47565fa5b9', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-09 17:27:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e232f89df26cc9e5eced10476c4e4a2b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-10 10:05:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('335956cbad23d1974138752199bf1d84', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-10 10:05:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('bd6d7d720b9dd803f8ad26e2d40870f3', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-10 11:04:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ff3f7dbda20cd2734b1238fa5ba17fcf', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-10 11:26:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('672b527c49dc349689288ebf2c43ed4d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-10 11:26:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('21510ebaa4eca640852420ed6f6cbe01', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-10 11:41:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3e2574b7b723fbc9c712b8e200ea0c84', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-10 14:24:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0d4582c6b7719b0bfc0260939d97274f', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-10 21:48:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3e64011b4bea7cdb76953bfbf57135ce', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-10 23:09:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('a83e37b55a07fe48272b0005a193dee6', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-11 09:17:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('30ec2dc50347240f131c1004ee9b3a40', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-11 10:19:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7ce1934fb542a406e92867aec5b7254d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-11 14:53:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5ee6d5fe1e6adcc4ad441b230fae802d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-11 15:56:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d4ef00700436645680657f72445d38db', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-11 18:05:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('aa49341b29865b45588ad2f9b89c47ea', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-11 19:42:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('d3b54be0510db6a6da27bf30becb5335', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-11 19:42:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('dd4e1ab492e59719173d8ae0f5dbc9a2', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-04-11 19:47:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('056dd4466f4ed51de26c535fd9864828', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-11 19:47:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('89bfd8b9d6fa57a8e7017a2345ec1534', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-12 09:27:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('51aeabed335ab4e238640a4d17dd51a3', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg-boot', '2019-04-12 10:12:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('67181c36b55b06047a16a031fd1262c1', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-05-17 13:55:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2d5af41d2df82b316ba31fcdf6168d6a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-05-17 14:43:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e2f703771f64b1bcd709204669ae3d93', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-05-17 14:48:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8143ce0b35bfe6e7b8113e1ecc066acd', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-05-17 14:48:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2bca2d6666c1f6630225252c7b31326c', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-05-17 18:30:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('11695a9dcf44859cda97a4226bebe21b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-05-17 18:30:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('40209016cadff6b571a8150c6218cfa8', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-05-18 11:33:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('23a314588249752842447e4f98783be4', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-05-19 18:28:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5f0a5e85efbe9c79645ffc0c15fcee1a', 2, '添加测试DEMO', NULL, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.add()', NULL, '[{\"createBy\":\"admin\",\"createTime\":1558261833637,\"id\":\"94f78b1c9753dfb1202d731f540666e1\",\"keyWord\":\"1\",\"name\":\"1\",\"sysOrgCode\":\"A01\"}]', NULL, 30, 'admin', '2019-05-19 18:30:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('57264fff74c4f857bddf5d766951f3c9', 2, '添加测试DEMO', NULL, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.add()', NULL, '[{\"createBy\":\"admin\",\"createTime\":1558262155067,\"id\":\"dcb45a2fc661e5cdc341b806e5914873\",\"name\":\"111\",\"sysOrgCode\":\"A01\"}]', NULL, 5, 'admin', '2019-05-19 18:35:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('eef5b90eea8e7394193443cfd7476529', 2, '删除测试DEMO', NULL, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.delete()', NULL, '[\"dcb45a2fc661e5cdc341b806e5914873\"]', NULL, 9, 'admin', '2019-05-19 18:36:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('488fc8f3d040fa75c6802898ea88f7d6', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-05-20 11:38:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('6c99cfe2774c15ad030b83723f81d70d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-05-20 14:07:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1bf5c5603b79f749d4ee75965b3698db', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-05-20 14:54:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5bca377b50c362009738d612cac82006', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-05-20 14:54:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('2255d6f5e2a3d0839b8b9cfc67816c5c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-05-20 15:01:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c7384ed6a6b09ff6704a6b1c1e378cee', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-07-05 14:45:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('63c998d68b4d0d1529d86b4c0628e072', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-07-05 14:45:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b096a9e76395f1a52d8c260c4eb811fd', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-08-23 18:51:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('da7d2236f6f9e0f61897e5ea9b968d4d', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-08-23 20:02:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('6ee846271a3d4b9e576b5a0749c49d12', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-08-23 20:02:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f6b0f562257bf02c983b9e3998ff864e', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-08-23 22:43:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('9e1da5d8758f2681543971ee43ee14e2', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-08-23 22:43:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('dd9b2cfffb798a22d90dada4fdbbbc61', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-08-23 23:39:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b99f5b6975350d86db4c5dd91de9f608', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-08-23 23:40:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1185035214331654145', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-10-18 11:29:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1185035238713143298', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-10-18 11:29:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1185035239463923713', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-10-18 11:29:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1185037047527714817', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-10-18 11:37:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1185037216109375490', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 133, 'admin', '2019-10-18 11:37:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1185037734533738497', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 24, 'admin', '2019-10-18 11:39:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1185037756142792705', 2, '编辑用户，id： e9ca23d68d884d4ebb19d07889727dae', 2, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-10-18 11:39:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1185037829144653825', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 12, 'admin', '2019-10-18 11:40:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1185039907581669377', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2019-10-18 11:48:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1185039947956039681', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2019-10-18 11:48:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1185040064834514945', 2, '职务表-添加', 2, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.add()', NULL, '[{\"code\":\"devleader\",\"createBy\":\"admin\",\"createTime\":1571370543072,\"id\":\"1185040064792571906\",\"name\":\"研发部经理\",\"rank\":\"3\",\"sysOrgCode\":\"A01\"}]', NULL, 22, 'admin', '2019-10-18 11:49:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1185040066562568193', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 26, 'admin', '2019-10-18 11:49:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1185129808478158850', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-10-18 17:45:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1185452151318528001', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-10-19 15:06:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1185452231589117953', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-10-19 15:06:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197430985244905474', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-11-21 16:26:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197431068325679105', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-11-21 16:26:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197431850395602945', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 41, 'admin', '2019-11-21 16:29:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197431872520556545', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 65, 'admin', '2019-11-21 16:29:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197431893076840450', 2, '职务表-编辑', 3, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.edit()', NULL, '[{\"code\":\"devleader\",\"createBy\":\"admin\",\"createTime\":1571370543000,\"id\":\"1185040064792571906\",\"name\":\"研发部经理\",\"postRank\":\"2\",\"sysOrgCode\":\"A01\",\"updateBy\":\"admin\",\"updateTime\":1574324985161}]', NULL, 19, 'admin', '2019-11-21 16:29:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197431893756317697', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 42, 'admin', '2019-11-21 16:29:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197433172830294018', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 22, 'admin', '2019-11-21 16:34:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197433546278539266', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 16, 'admin', '2019-11-21 16:36:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197433566151151618', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-11-21 16:36:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197434320656130049', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-11-21 16:39:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197434360204222466', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 240, 'admin', '2019-11-21 16:39:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197434364826345474', 2, '编辑用户，id： e9ca23d68d884d4ebb19d07889727dae', 2, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2019-11-21 16:39:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197434403829178369', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-11-21 16:39:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197434443708620802', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-11-21 16:39:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197434470036267009', 2, '职务表-分页列表查询', 1, 'jeecg', 'jeecg', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 45, 'jeecg', '2019-11-21 16:40:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197434579583098881', 2, '职务表-分页列表查询', 1, 'jeecg', 'jeecg', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 46, 'jeecg', '2019-11-21 16:40:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197448449475338242', 1, '用户名: jeecg,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-11-21 17:35:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197448475219976193', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-11-21 17:35:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197448491221245953', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 98, 'admin', '2019-11-21 17:35:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197449269478547458', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 43, 'admin', '2019-11-21 17:38:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197450304582443009', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 27, 'admin', '2019-11-21 17:42:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197453216322797569', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 526, 'admin', '2019-11-21 17:54:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197454357987155969', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 329, 'admin', '2019-11-21 17:59:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197792320302452738', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-11-22 16:21:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197792369866543106', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jeecg', '2019-11-22 16:22:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1197793164787802113', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 381, 'admin', '2019-11-22 16:25:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209402348671193089', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-24 17:16:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209402408473579521', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-24 17:16:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209402471128092673', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 472, 'admin', '2019-12-24 17:16:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209417003212853250', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 42, 'admin', '2019-12-24 18:14:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209646296664756226', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 09:25:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209646643298816001', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 09:26:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209648067323744257', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 28, 'admin', '2019-12-25 09:32:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209648217823760385', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 21, 'admin', '2019-12-25 09:33:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209648344894394369', 2, '填值规则-批量删除', 4, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.deleteBatch()', NULL, '[\"1192350056519323649,1192349918153428994,\"]', NULL, 23, 'admin', '2019-12-25 09:33:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209648345854889985', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 17, 'admin', '2019-12-25 09:33:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209648456588709890', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 122, 'admin', '2019-12-25 09:34:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209648997351936002', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 24, 'admin', '2019-12-25 09:36:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209649005795069954', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 25, 'admin', '2019-12-25 09:36:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209649012203966466', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 17, 'admin', '2019-12-25 09:36:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209653324963500034', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 19, 'admin', '2019-12-25 09:53:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209653453917376513', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 15, 'admin', '2019-12-25 09:53:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209660332378755073', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 126, 'admin', '2019-12-25 10:21:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209660342411530241', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 26, 'admin', '2019-12-25 10:21:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209672160353783810', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 170, 'admin', '2019-12-25 11:08:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209672431796555778', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 42, 'admin', '2019-12-25 11:09:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1209847153045913602', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 22:43:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231582569151074306', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-23 22:12:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231582603032662018', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-23 22:12:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231582605322752002', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-23 22:12:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231586195961556994', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-23 22:26:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231586370448797697', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 540, 'admin', '2020-02-23 22:27:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231589034586804226', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 37, 'admin', '2020-02-23 22:38:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231589059643576321', 2, '编辑用户，id： e9ca23d68d884d4ebb19d07889727dae', 2, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-02-23 22:38:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231590342991548417', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 26, 'admin', '2020-02-23 22:43:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231590348280565761', 2, '编码校验规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysCheckRuleController.queryPageList()', NULL, NULL, NULL, 27, 'admin', '2020-02-23 22:43:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231590455747022850', 2, '部门角色-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysDepartRoleController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-02-23 22:43:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231590510293946370', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 15, 'admin', '2020-02-23 22:43:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231590533404561410', 2, '编辑用户，id： e9ca23d68d884d4ebb19d07889727dae', 2, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-02-23 22:44:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231590588148617218', 2, '部门角色-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysDepartRoleController.queryPageList()', NULL, NULL, NULL, 45, 'admin', '2020-02-23 22:44:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231590598588239874', 2, '部门角色-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysDepartRoleController.queryPageList()', NULL, NULL, NULL, 8, 'admin', '2020-02-23 22:44:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231590600106577921', 2, '部门角色-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysDepartRoleController.queryPageList()', NULL, NULL, NULL, 11, 'admin', '2020-02-23 22:44:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231590978101448705', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 17, 'admin', '2020-02-23 22:45:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231591017582432257', 2, '多数据源管理-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysDataSourceController.queryPageList()', NULL, NULL, NULL, 41, 'admin', '2020-02-23 22:45:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231593459988566017', 2, '部门角色-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysDepartRoleController.queryPageList()', NULL, NULL, NULL, 22, 'admin', '2020-02-23 22:55:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231593466594594817', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 13, 'admin', '2020-02-23 22:55:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231593479697600513', 2, '职务表-编辑', 3, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.edit()', NULL, '[{\"code\":\"devleader\",\"createBy\":\"admin\",\"createTime\":1571370543000,\"id\":\"1185040064792571906\",\"name\":\"研发部经理\",\"postRank\":\"2\",\"sysOrgCode\":\"A01\",\"updateBy\":\"admin\",\"updateTime\":1582469742105}]', NULL, 16, 'admin', '2020-02-23 22:55:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231593480725204994', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 16, 'admin', '2020-02-23 22:55:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231596465543032834', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-23 23:07:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231596468936224769', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-23 23:07:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231596595327381506', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-23 23:08:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231596596799582209', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-23 23:08:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231596742199324674', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-23 23:08:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231596743692496897', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-23 23:08:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231597287962157057', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-23 23:10:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231597290327744513', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-23 23:10:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231598580457857025', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-23 23:15:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231599446049009666', 2, '部门角色-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysDepartRoleController.queryPageList()', NULL, NULL, NULL, 62, 'admin', '2020-02-23 23:19:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231599453611339778', 2, '部门角色-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysDepartRoleController.queryPageList()', NULL, NULL, NULL, 17, 'admin', '2020-02-23 23:19:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231599534171336706', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 25, 'admin', '2020-02-23 23:19:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231599542991958018', 2, '部门角色-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysDepartRoleController.queryPageList()', NULL, NULL, NULL, 23, 'admin', '2020-02-23 23:19:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231615277050998786', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-24 00:22:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231615300820119553', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-24 00:22:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231645918777962498', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-24 02:24:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231660660535951362', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-24 03:22:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231772559046967297', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-24 10:47:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231772634972258306', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-24 10:47:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231872139147202561', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 294, 'admin', '2020-02-24 17:23:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231872145841311746', 2, '编码校验规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysCheckRuleController.queryPageList()', NULL, NULL, NULL, 98, 'admin', '2020-02-24 17:23:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231872154540298242', 2, '多数据源管理-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysDataSourceController.queryPageList()', NULL, NULL, NULL, 334, 'admin', '2020-02-24 17:23:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1231888100260655106', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-24 18:26:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232120592192311297', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-25 09:50:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232121930921873409', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-25 09:55:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232123986592206850', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 48, 'admin', '2020-02-25 10:03:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232124039033589761', 2, '编辑用户，id： a75d45a015c44384a04449ee80dc3503', 2, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-02-25 10:03:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232124050710532098', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-25 10:04:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232124114992435202', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-25 10:04:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232124523609919489', 1, '用户名: jeecg,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-25 10:05:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232124588416110593', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-25 10:06:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232125009155133442', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-25 10:07:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232125087760584706', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-25 10:08:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232125284058206209', 1, '用户名: jeecg,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-25 10:08:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232125346289094658', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-25 10:09:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232125555614224385', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-25 10:09:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232125615475331073', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-25 10:10:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232125831045779457', 1, '用户名: jeecg,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-25 10:11:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232230001392308226', 1, '用户名: jeecg测试,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-25 17:05:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232230077393096705', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-25 17:05:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232231182843883522', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-25 17:09:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1232231223797067777', 1, '用户名: jeecg,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-25 17:09:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1235143593301209090', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-04 18:02:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1235170990046130178', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-04 19:51:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1235202803376402433', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-04 21:57:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1235202873094123522', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-04 21:58:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256482167137071106', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 15:14:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256483667833794561', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 15:20:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256484419314659330', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@38dd4fee', NULL, 55, 'admin', '2020-05-02 15:23:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256484434414153729', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 99999  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@1edaf52d', NULL, 25, 'admin', '2020-05-02 15:23:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256485080102170625', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@20123ff4', NULL, 53, 'admin', '2020-05-02 15:26:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256485085294718978', 2, '编辑用户，id： e9ca23d68d884d4ebb19d07889727dae', 2, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-05-02 15:26:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256485469157421057', 2, '编辑用户，id： e9ca23d68d884d4ebb19d07889727dae', 2, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-05-02 15:27:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256485494486822914', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@3773cfae', NULL, 25, 'admin', '2020-05-02 15:27:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256485574329593858', 2, '职务表-添加', 2, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.add()', NULL, '[{\"code\":\"总经理\",\"createBy\":\"admin\",\"createTime\":1588404479920,\"id\":\"1256485574212153345\",\"name\":\"laozong\",\"postRank\":\"5\",\"sysOrgCode\":\"北京国炬公司\"}]', NULL, 12, 'admin', '2020-05-02 15:28:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256485574790967298', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@4df33d14', NULL, 59, 'admin', '2020-05-02 15:28:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256485587097055234', 2, '职务表-编辑', 3, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.edit()', NULL, '[{\"code\":\"总经理\",\"createBy\":\"admin\",\"createTime\":1588404480000,\"id\":\"1256485574212153345\",\"name\":\"laozong\",\"postRank\":\"5\",\"sysOrgCode\":\"北京国炬公司\",\"updateBy\":\"admin\",\"updateTime\":1588404482983}]', NULL, 17, 'admin', '2020-05-02 15:28:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256485587436793858', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@34437d6a', NULL, 20, 'admin', '2020-05-02 15:28:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256485616851447809', 2, '职务表-添加', 2, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.add()', NULL, '[{\"code\":\"1\",\"createBy\":\"admin\",\"createTime\":1588404490080,\"id\":\"1256485616817893378\",\"name\":\"1\",\"postRank\":\"1\",\"sysOrgCode\":\"北京国炬公司\"}]', NULL, 8, 'admin', '2020-05-02 15:28:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256485617317015554', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@65ab758f', NULL, 34, 'admin', '2020-05-02 15:28:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256485628339646465', 2, '职务表-通过id删除', 4, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.delete()', NULL, '  id: 1256485616817893378', NULL, 8, 'admin', '2020-05-02 15:28:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256485628721328129', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@63ed8b8', NULL, 19, 'admin', '2020-05-02 15:28:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256485878894784514', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@5eee71e7', NULL, 25, 'admin', '2020-05-02 15:29:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256485915808854017', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@55d170fd', NULL, 21, 'admin', '2020-05-02 15:29:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256487060673490946', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 99999  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@70eaa8bc', NULL, 20, 'admin', '2020-05-02 15:33:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256487125404184577', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@3bc7b343', NULL, 14, 'admin', '2020-05-02 15:34:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256487161898823682', 2, '编辑用户，id： a75d45a015c44384a04449ee80dc3503', 2, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-05-02 15:34:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256487210473058305', 2, '编辑用户，id： a75d45a015c44384a04449ee80dc3503', 2, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-05-02 15:34:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256487242727256066', 2, '删除用户，id： 42d153bffeea74f72a9c1697874fa4a7', 3, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-05-02 15:34:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256487299895619585', 2, '编辑用户，id： f0019fdebedb443c98dcb17d88222c38', 2, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-05-02 15:34:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256488477320638466', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@7a60531e', NULL, 25, 'admin', '2020-05-02 15:39:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256488490658525186', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@2d83211b', NULL, 17, 'admin', '2020-05-02 15:39:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256489011385561089', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@4c2899e6', NULL, 13, 'admin', '2020-05-02 15:41:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256489680158945281', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@e1ab519', NULL, 24, 'admin', '2020-05-02 15:44:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256489882299232258', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@4694c325', NULL, 13, 'admin', '2020-05-02 15:45:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256490012620451841', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@612705a8', NULL, 16, 'admin', '2020-05-02 15:45:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256490056123772929', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@57f572e8', NULL, 14, 'admin', '2020-05-02 15:45:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256490157718204417', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@534d6ebf', NULL, 16, 'admin', '2020-05-02 15:46:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256490172926750722', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@351222f2', NULL, 19, 'admin', '2020-05-02 15:46:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256490193340428289', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@52a9a2e6', NULL, 20, 'admin', '2020-05-02 15:46:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256490829935112194', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@6d54e7ee', NULL, 12, 'admin', '2020-05-02 15:48:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256490944309587970', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@62629cc6', NULL, 16, 'admin', '2020-05-02 15:49:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256490967088852994', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@8c9d2b1', NULL, 11, 'admin', '2020-05-02 15:49:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256491122944995330', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@3732988a', NULL, 15, 'admin', '2020-05-02 15:50:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256491834928099329', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@431d17a8', NULL, 13, 'admin', '2020-05-02 15:52:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256491996039704578', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@5f5721f1', NULL, 12, 'admin', '2020-05-02 15:53:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256492339301543938', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@2dd65164', NULL, 22, 'admin', '2020-05-02 15:54:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256492360629579778', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@739b8264', NULL, 25, 'admin', '2020-05-02 15:54:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256492389415088130', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@16b523ad', NULL, 18, 'admin', '2020-05-02 15:55:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256493213293834242', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@4467f24e', NULL, 15, 'admin', '2020-05-02 15:58:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256493329329254401', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@e0ddd58', NULL, 18, 'admin', '2020-05-02 15:58:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256493354331500545', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@441b74f0', NULL, 15, 'admin', '2020-05-02 15:58:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256493373541412866', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@57c50dd7', NULL, 12, 'admin', '2020-05-02 15:58:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256527132428972033', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@7e667652', NULL, 541, 'admin', '2020-05-02 18:13:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256527391850868737', 2, '编辑DEMO', 3, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.edit()', NULL, '[{\"createBy\":\"jeecg-boot\",\"createTime\":1553768199000,\"id\":\"73bc58611012617ca446d8999379e4ac\",\"keyWord\":\"777\",\"name\":\"郭靖\",\"punchTime\":1544112000000,\"updateBy\":\"admin\",\"updateTime\":1588414449977}]', NULL, 11, 'admin', '2020-05-02 18:14:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256527408170905601', 2, '编辑DEMO', 3, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.edit()', NULL, '[{\"createBy\":\"jeecg-boot\",\"createTime\":1553768199000,\"id\":\"73bc58611012617ca446d8999379e4ac\",\"keyWord\":\"777\",\"name\":\"郭靖\",\"punchTime\":1544112000000,\"sex\":\"1\",\"updateBy\":\"admin\",\"updateTime\":1588414453907}]', NULL, 7, 'admin', '2020-05-02 18:14:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256527447572197378', 2, '删除测试DEMO', 4, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.delete()', NULL, '  id: c0b7c3de7c62a295ab715943de8a315d', NULL, 7, 'admin', '2020-05-02 18:14:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256527487334199297', 2, '编辑DEMO', 3, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.demo.test.controller.JeecgDemoController.edit()', NULL, '[{\"createBy\":\"scott\",\"createTime\":1547873698000,\"id\":\"94420c5d8fc4420dde1e7196154b3a24\",\"name\":\"秦风\",\"sex\":\"2\",\"updateBy\":\"admin\",\"updateTime\":1588414472782}]', NULL, 6, 'admin', '2020-05-02 18:14:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256528708895879170', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 99999  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@3ec5357c', NULL, 24, 'admin', '2020-05-02 18:19:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256528740931973122', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@20a782a2', NULL, 16, 'admin', '2020-05-02 18:19:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256528778097700866', 2, '编辑用户，id： e9ca23d68d884d4ebb19d07889727dae', 2, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-05-02 18:19:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256529143853592577', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 99999  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@53b67601', NULL, 15, 'admin', '2020-05-02 18:21:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256529179186409473', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 99999  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@4034ff3d', NULL, 14, 'admin', '2020-05-02 18:21:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256529242847555585', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@300c18c2', NULL, 15, 'admin', '2020-05-02 18:21:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256529251169054721', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 99999  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@5cbc1ed0', NULL, 14, 'admin', '2020-05-02 18:21:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256538346588590082', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 18:57:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256538366448619522', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 18:57:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256538504642547713', 2, '多数据源管理-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysDataSourceController.queryPageList()', NULL, '  sysDataSource: SysDataSource(id=null, code=null, name=null, remark=null, dbType=null, dbDriver=null, dbUrl=null, dbName=null, dbUsername=null, dbPassword=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@6e768567', NULL, 73, 'admin', '2020-05-02 18:58:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256538902770077698', 2, '多数据源管理-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysDataSourceController.queryPageList()', NULL, '  sysDataSource: SysDataSource(id=null, code=null, name=null, remark=null, dbType=null, dbDriver=null, dbUrl=null, dbName=null, dbUsername=null, dbPassword=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@74d2b870', NULL, 17, 'admin', '2020-05-02 18:59:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256548329908609025', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, '  sysFillRule: SysFillRule(id=null, ruleName=null, ruleCode=null, ruleClass=null, ruleParams=null, updateBy=null, updateTime=null, createBy=null, createTime=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@5e32c585', NULL, 181, 'admin', '2020-05-02 19:37:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256548333775757314', 2, '编码校验规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysCheckRuleController.queryPageList()', NULL, '  sysCheckRule: SysCheckRule(id=null, ruleName=null, ruleCode=null, ruleJson=null, ruleDescription=null, updateBy=null, updateTime=null, createBy=null, createTime=null)  pageNo: 1  pageSize: 10  request: org.apache.shiro.web.servlet.ShiroHttpServletRequest@4f008a7d', NULL, 41, 'admin', '2020-05-02 19:37:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256548338318188545', 2, '多数据源管理-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysDataSourceController.queryPageList()', NULL, '  sysDataSource: SysDataSource(id=null, code=null, name=null, remark=null, dbType=null, dbDriver=null, dbUrl=null, dbName=null, dbUsername=null, dbPassword=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@7827b492', NULL, 31, 'admin', '2020-05-02 19:37:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256548342671876097', 2, '编码校验规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysCheckRuleController.queryPageList()', NULL, '  sysCheckRule: SysCheckRule(id=null, ruleName=null, ruleCode=null, ruleJson=null, ruleDescription=null, updateBy=null, updateTime=null, createBy=null, createTime=null)  pageNo: 1  pageSize: 10  request: org.apache.shiro.web.servlet.ShiroHttpServletRequest@25cfa316', NULL, 27, 'admin', '2020-05-02 19:37:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256548345805021186', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, '  sysFillRule: SysFillRule(id=null, ruleName=null, ruleCode=null, ruleClass=null, ruleParams=null, updateBy=null, updateTime=null, createBy=null, createTime=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@39541cd2', NULL, 26, 'admin', '2020-05-02 19:37:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256548524465594370', 2, '多数据源管理-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysDataSourceController.queryPageList()', NULL, '  sysDataSource: SysDataSource(id=null, code=null, name=null, remark=null, dbType=null, dbDriver=null, dbUrl=null, dbName=null, dbUsername=null, dbPassword=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@51a7dbe', NULL, 15, 'admin', '2020-05-02 19:38:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256550098638217218', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 19:44:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256572017869594626', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 21:11:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256572334438883329', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 21:12:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256572347516723201', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 21:12:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256572526244405249', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 21:13:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256599302815461378', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 22:59:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256600609391489025', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 23:05:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256600722662862849', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 23:05:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256600723023572993', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 23:05:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256601173458268161', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 23:07:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256601320892248066', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, '  sysFillRule: SysFillRule(id=null, ruleName=null, ruleCode=null, ruleClass=null, ruleParams=null, updateBy=null, updateTime=null, createBy=null, createTime=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@6703cc80', NULL, 44, 'admin', '2020-05-02 23:07:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256604650926354434', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 23:21:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256604684468203522', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 23:21:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256604684845690882', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 23:21:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256604994200776706', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 23:22:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256604994595041282', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 23:22:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256605284085903361', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 23:23:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256609868795719682', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 23:41:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256610665751228417', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 23:45:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256611419610263553', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 23:48:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256611628176224257', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 23:48:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256611628545323010', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 23:48:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256611717628145666', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-02 23:49:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256627765207216130', 2, 'Online报表，sql解析：select DATE_FORMAT(create_time,  \'%Y-%m-%d\') as date,count(*) as num from sys_log group by DATE_FORMAT(create_time, \'%Y-%m-%d\')', 2, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-05-03 00:53:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256628324886753282', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, '  sysFillRule: SysFillRule(id=null, ruleName=null, ruleCode=null, ruleClass=null, ruleParams=null, updateBy=null, updateTime=null, createBy=null, createTime=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@51bbe048', NULL, 17, 'admin', '2020-05-03 00:55:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256628328594518018', 2, '编码校验规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysCheckRuleController.queryPageList()', NULL, '  sysCheckRule: SysCheckRule(id=null, ruleName=null, ruleCode=null, ruleJson=null, ruleDescription=null, updateBy=null, updateTime=null, createBy=null, createTime=null)  pageNo: 1  pageSize: 10  request: org.apache.shiro.web.servlet.ShiroHttpServletRequest@13b6b967', NULL, 59, 'admin', '2020-05-03 00:55:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256628331551502337', 2, '多数据源管理-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysDataSourceController.queryPageList()', NULL, '  sysDataSource: SysDataSource(id=null, code=null, name=null, remark=null, dbType=null, dbDriver=null, dbUrl=null, dbName=null, dbUsername=null, dbPassword=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@478b2fb3', NULL, 12, 'admin', '2020-05-03 00:55:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256630123769212929', 2, '多数据源管理-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysDataSourceController.queryPageList()', NULL, '  sysDataSource: SysDataSource(id=null, code=null, name=null, remark=null, dbType=null, dbDriver=null, dbUrl=null, dbName=null, dbUsername=null, dbPassword=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@7fc037db', NULL, 25, 'admin', '2020-05-03 01:02:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256630125769895938', 2, '编码校验规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysCheckRuleController.queryPageList()', NULL, '  sysCheckRule: SysCheckRule(id=null, ruleName=null, ruleCode=null, ruleJson=null, ruleDescription=null, updateBy=null, updateTime=null, createBy=null, createTime=null)  pageNo: 1  pageSize: 10  request: org.apache.shiro.web.servlet.ShiroHttpServletRequest@67b1d09a', NULL, 10, 'admin', '2020-05-03 01:02:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256630127565058049', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, '  sysFillRule: SysFillRule(id=null, ruleName=null, ruleCode=null, ruleClass=null, ruleParams=null, updateBy=null, updateTime=null, createBy=null, createTime=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@7e3105cb', NULL, 11, 'admin', '2020-05-03 01:02:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256630191603691522', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, '  sysFillRule: SysFillRule(id=null, ruleName=null, ruleCode=null, ruleClass=null, ruleParams=null, updateBy=null, updateTime=null, createBy=null, createTime=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@406d0b25', NULL, 12, 'admin', '2020-05-03 01:02:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256630197496688641', 2, '编码校验规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysCheckRuleController.queryPageList()', NULL, '  sysCheckRule: SysCheckRule(id=null, ruleName=null, ruleCode=null, ruleJson=null, ruleDescription=null, updateBy=null, updateTime=null, createBy=null, createTime=null)  pageNo: 1  pageSize: 10  request: org.apache.shiro.web.servlet.ShiroHttpServletRequest@5d746f1c', NULL, 9, 'admin', '2020-05-03 01:02:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256630200965378050', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, '  sysFillRule: SysFillRule(id=null, ruleName=null, ruleCode=null, ruleClass=null, ruleParams=null, updateBy=null, updateTime=null, createBy=null, createTime=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@771a0535', NULL, 9, 'admin', '2020-05-03 01:02:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256631022684057602', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@552e978f', NULL, 177, 'admin', '2020-05-03 01:05:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256631095019024385', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@7b8d5eda', NULL, 25, 'admin', '2020-05-03 01:06:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256631629037809666', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@719fa12f', NULL, 14, 'admin', '2020-05-03 01:08:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256631703578980354', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@22c83dfe', NULL, 17, 'admin', '2020-05-03 01:08:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256631875029544961', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@73bbad53', NULL, 18, 'admin', '2020-05-03 01:09:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256632739672731649', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@36f7e6ea', NULL, 15, 'admin', '2020-05-03 01:12:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256632995709825025', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@668f45b1', NULL, 63, 'admin', '2020-05-03 01:13:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256633330130071553', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@735e4fde', NULL, 24, 'admin', '2020-05-03 01:15:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256633509134577666', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@6c495862', NULL, 17, 'admin', '2020-05-03 01:15:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256633551425744897', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@6908d196', NULL, 13, 'admin', '2020-05-03 01:16:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256633599651852289', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@5bfb2ada', NULL, 14, 'admin', '2020-05-03 01:16:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256633656652443650', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@549ef5f1', NULL, 15, 'admin', '2020-05-03 01:16:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256636582515027970', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, '  sysFillRule: SysFillRule(id=null, ruleName=null, ruleCode=null, ruleClass=null, ruleParams=null, updateBy=null, updateTime=null, createBy=null, createTime=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@4264deb1', NULL, 10, 'admin', '2020-05-03 01:28:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256644151597969409', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, '  sysFillRule: SysFillRule(id=null, ruleName=null, ruleCode=null, ruleClass=null, ruleParams=null, updateBy=null, updateTime=null, createBy=null, createTime=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@2218706b', NULL, 9, 'admin', '2020-05-03 01:58:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256644154894692354', 2, '编码校验规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysCheckRuleController.queryPageList()', NULL, '  sysCheckRule: SysCheckRule(id=null, ruleName=null, ruleCode=null, ruleJson=null, ruleDescription=null, updateBy=null, updateTime=null, createBy=null, createTime=null)  pageNo: 1  pageSize: 10  request: org.apache.shiro.web.servlet.ShiroHttpServletRequest@5b4819a1', NULL, 15, 'admin', '2020-05-03 01:58:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1256644156803100673', 2, '多数据源管理-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysDataSourceController.queryPageList()', NULL, '  sysDataSource: SysDataSource(id=null, code=null, name=null, remark=null, dbType=null, dbDriver=null, dbUrl=null, dbName=null, dbUsername=null, dbPassword=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@115ba167', NULL, 9, 'admin', '2020-05-03 01:58:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1282889367758860290', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-14 12:07:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1282889583434166273', 2, '多数据源管理-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysDataSourceController.queryPageList()', NULL, '  sysDataSource: SysDataSource(id=null, code=null, name=null, remark=null, dbType=null, dbDriver=null, dbUrl=null, dbName=null, dbUsername=null, dbPassword=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@6ead845', NULL, 170, 'admin', '2020-07-14 12:08:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1282889590115692545', 2, '编码校验规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysCheckRuleController.queryPageList()', NULL, '  sysCheckRule: SysCheckRule(id=null, ruleName=null, ruleCode=null, ruleJson=null, ruleDescription=null, updateBy=null, updateTime=null, createBy=null, createTime=null)  pageNo: 1  pageSize: 10  request: org.apache.shiro.web.servlet.ShiroHttpServletRequest@9a27bb1', NULL, 38, 'admin', '2020-07-14 12:08:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1282889594012200962', 2, '填值规则-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysFillRuleController.queryPageList()', NULL, '  sysFillRule: SysFillRule(id=null, ruleName=null, ruleCode=null, ruleClass=null, ruleParams=null, updateBy=null, updateTime=null, createBy=null, createTime=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@43de1dc3', NULL, 38, 'admin', '2020-07-14 12:08:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1282925459103109121', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-14 14:30:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1282925508289712129', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-14 14:30:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1282943539573284865', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-14 15:42:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1282950229681000450', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-14 16:09:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1282950304205393922', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-14 16:09:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1283301022338646018', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-15 15:23:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1283301074691948545', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-15 15:23:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1283674380876124161', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-16 16:06:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1283678885785112578', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@7b46a1c2', NULL, 102, 'admin', '2020-07-16 16:24:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1283747541814665217', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-16 20:57:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1283775929682026497', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-16 22:50:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1283779306008662018', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-16 23:03:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1283932314273128449', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-17 09:11:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1283932403578249217', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-17 09:11:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1284014918896779266', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-17 14:39:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1284014956536463361', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-17 14:39:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1284398259781287937', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-18 16:03:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1285115165769252865', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-20 15:31:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1285115206852460546', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-20 15:31:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1285474292991385602', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-21 15:18:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1285474337736220673', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-21 15:19:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1285782296529768449', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-22 11:42:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1285837638890541057', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-22 15:22:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1285854085045866497', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-22 16:27:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1285854126171017217', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-22 16:28:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1287577725818933249', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-27 10:37:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1287577767111856129', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-27 10:37:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1287633479791820801', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-27 14:18:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1287633525442625538', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-27 14:18:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288310700923703298', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-29 11:09:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288385006701662209', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-29 16:04:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288385051509411841', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-29 16:05:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288410907162218497', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-29 17:47:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288414817306316801', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-29 18:03:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288414855260573697', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-29 18:03:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288415471680655362', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-29 18:06:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288415812014870530', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 99999  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@33f0b2c5', NULL, 56, 'admin', '2020-07-29 18:07:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288415842985611265', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@66ef3418', NULL, 10, 'admin', '2020-07-29 18:07:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288423457920684033', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 99999  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@56e57d6c', NULL, 14, 'admin', '2020-07-29 18:37:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288423469446631426', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@1389664f', NULL, 11, 'admin', '2020-07-29 18:37:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288423495799443457', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@6588c0e0', NULL, 12, 'admin', '2020-07-29 18:37:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288425285068558337', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-29 18:45:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288433019281248257', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@2d58f68f', NULL, 14, 'admin', '2020-07-29 19:15:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288433115611828225', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@5a264df5', NULL, 9, 'admin', '2020-07-29 19:16:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288433130119925762', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@4cced7d7', NULL, 14, 'admin', '2020-07-29 19:16:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288440739401076738', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@4c2f5608', NULL, 15, 'admin', '2020-07-29 19:46:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288440744014811138', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@560a9d3', NULL, 12, 'admin', '2020-07-29 19:46:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288440747491889154', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@db8b4a0', NULL, 14, 'admin', '2020-07-29 19:46:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288441401027387394', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-29 19:49:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288442299287920642', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-29 19:52:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288642590239158274', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-30 09:08:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288725044261851137', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-30 14:36:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288725987258830850', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@1f37dd12', NULL, 130, 'admin', '2020-07-30 14:39:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288726176866537473', 2, '删除用户，id： f0019fdebedb443c98dcb17d88222c38', 3, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-07-30 14:40:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288726206595764226', 2, '删除用户，id： a75d45a015c44384a04449ee80dc3503', 3, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-07-30 14:40:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288740897724379139', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=总经理,, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 1  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@797fd566', NULL, 193, 'admin', '2020-07-30 15:39:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288740897724379138', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@68f849aa', NULL, 217, 'admin', '2020-07-30 15:39:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288744874264309762', 2, '编辑用户，id： ba8812b74f38469085ac008fbfca8896', 2, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-07-30 15:54:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288753081267326978', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-30 16:27:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288753170811523073', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@7ee8031', NULL, 91, 'admin', '2020-07-30 16:27:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288755883154673666', 2, '删除用户，id： 9350c5b633124c34a0621c4cb1a80161', 3, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-07-30 16:38:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288760716439867394', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-30 16:57:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288760837604921346', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-30 16:58:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288761256850771969', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@26f8f27b', NULL, 83, 'admin', '2020-07-30 17:00:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288765762523205634', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-30 17:17:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288765820488486914', 2, '删除用户，id： ba8812b74f38469085ac008fbfca8896', 3, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-07-30 17:18:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288765884304822274', 2, '删除用户，id： a7dce4443ddd435490042a6bab3c5001', 3, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-07-30 17:18:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288766127079526402', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@4ce8b7db', NULL, 1344, 'admin', '2020-07-30 17:19:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288766128635613186', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=总经理,, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 1  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@36c40847', NULL, 1721, 'admin', '2020-07-30 17:19:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288766194955948033', 2, '编辑用户，id： ba8812b74f38469085ac008fbfca8896', 2, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-07-30 17:19:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288769297755156481', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=总经理,, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 1  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@3da638ff', NULL, 401, 'admin', '2020-07-30 17:31:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288769297755156482', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@10b89c78', NULL, 409, 'admin', '2020-07-30 17:31:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288769378088660994', 2, '编辑用户，id： ba8812b74f38469085ac008fbfca8896', 2, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-07-30 17:32:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288846154261397505', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-30 22:37:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288846276277895170', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-30 22:37:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288846341025366018', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@7d6a300c', NULL, 2179, 'admin', '2020-07-30 22:38:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288848744923578369', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@44e5689b', NULL, 142, 'admin', '2020-07-30 22:47:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288852987994755073', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-30 23:04:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288853014121074689', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@6fa47db4', NULL, 227, 'admin', '2020-07-30 23:04:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288860175584763906', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@fa3e262', NULL, 130, 'admin', '2020-07-30 23:33:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288866676412051458', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@5b704628', NULL, 169, 'admin', '2020-07-30 23:58:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288867815836676098', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@2adf733a', NULL, 20, 'admin', '2020-07-31 00:03:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288867822102966274', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=总经理,, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 1  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@2df115f2', NULL, 1515, 'admin', '2020-07-31 00:03:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288875420906754049', 1, '用户名: 管理员,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-31 00:33:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288875514783666178', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-31 00:34:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288875618626244610', 2, '删除用户，id： 94545bfa17db437aa1d6f3f0f4634ce7', 3, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-07-31 00:34:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288875679284269058', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@314e543c', NULL, 241, 'admin', '2020-07-31 00:34:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288878791071920130', 2, '删除用户，id： 77053e1656bd4cb684f2b10e323fff52', 3, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-07-31 00:47:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288878834143227906', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@2626972c', NULL, 114, 'admin', '2020-07-31 00:47:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288880870360379393', 2, '编辑用户，id： ba8812b74f38469085ac008fbfca8896', 2, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-07-31 00:55:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288882381660389377', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@2e37550a', NULL, 255, 'admin', '2020-07-31 01:01:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288884703308341250', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-31 01:10:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288884759608483841', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@69b1e3ee', NULL, 890, 'admin', '2020-07-31 01:10:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288884825048014849', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@61de4126', NULL, 132, 'admin', '2020-07-31 01:11:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288885353958137857', 2, '删除用户，id： 2127ba1e3c1e45c6bcd71805c89c5c52', 3, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-07-31 01:13:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288887891654631425', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=总经理,, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 1  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@667f60a2', NULL, 157, 'admin', '2020-07-31 01:23:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288887891654631426', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@7ea66408', NULL, 149, 'admin', '2020-07-31 01:23:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288888007010574338', 2, '编辑用户，id： ba8812b74f38469085ac008fbfca8896', 2, 'admin', '管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-07-31 01:23:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288888777395167234', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@4f345418', NULL, 125, 'admin', '2020-07-31 01:26:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1288888778309525505', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '127.0.0.1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=总经理,, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 1  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@4b822db5', NULL, 343, 'admin', '2020-07-31 01:26:46', NULL, NULL);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单标题',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件',
  `component_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件名字',
  `redirect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级菜单跳转地址',
  `menu_type` int(11) NULL DEFAULT NULL COMMENT '菜单类型(0:一级菜单; 1:子菜单:2:按钮权限)',
  `perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单权限编码',
  `perms_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '权限策略1显示2禁用',
  `sort_no` double(8, 2) NULL DEFAULT NULL COMMENT '菜单排序',
  `always_show` tinyint(1) NULL DEFAULT NULL COMMENT '聚合子路由: 1是0否',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `is_route` tinyint(1) NULL DEFAULT 1 COMMENT '是否路由菜单: 0:不是  1:是（默认值1）',
  `is_leaf` tinyint(1) NULL DEFAULT NULL COMMENT '是否叶子节点:    1:是   0:不是',
  `keep_alive` tinyint(1) NULL DEFAULT NULL COMMENT '是否缓存该页面:    1:是   0:不是',
  `hidden` int(2) NULL DEFAULT 0 COMMENT '是否隐藏路由: 0否,1是',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除状态 0正常 1已删除',
  `rule_flag` int(3) NULL DEFAULT 0 COMMENT '是否添加数据权限1是0否',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮权限状态(0无效1有效)',
  `internal_or_external` tinyint(1) NULL DEFAULT NULL COMMENT '外链菜单打开方式 0/内部打开 1/外部打开',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_prem_pid`(`parent_id`) USING BTREE,
  INDEX `index_prem_is_route`(`is_route`) USING BTREE,
  INDEX `index_prem_is_leaf`(`is_leaf`) USING BTREE,
  INDEX `index_prem_sort_no`(`sort_no`) USING BTREE,
  INDEX `index_prem_del_flag`(`del_flag`) USING BTREE,
  INDEX `index_menu_type`(`menu_type`) USING BTREE,
  INDEX `index_menu_hidden`(`hidden`) USING BTREE,
  INDEX `index_menu_status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('020b06793e4de2eee0007f603000c769', 'f0675b52d89100ee88472b6800754a08', '个人温度监测', '/ireport/monitorList', 'report/MonitorList', NULL, NULL, 1, NULL, NULL, 3.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-04-03 19:08:53', 'admin', '2020-07-29 18:56:09', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('1170592628746878978', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '菜单管理2', '/isystem/newPermissionList', 'system/NewPermissionList', NULL, NULL, 1, NULL, '1', 100.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-09-08 15:00:05', 'admin', '2019-12-25 09:58:18', 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1174506953255182338', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '职务管理', '/isystem/position', 'system/SysPositionList', NULL, NULL, 1, NULL, '1', 2.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-09-19 10:14:13', 'admin', '2019-09-19 10:15:22', 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1174590283938041857', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '通讯录', '/isystem/addressList', 'system/AddressList', NULL, NULL, 1, NULL, '1', 3.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-09-19 15:45:21', NULL, NULL, 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1288427049394147330', 'f0675b52d89100ee88472b6800754a08', '园区超标人员监测', '/ireport/exceedingList', 'report/ExceedingList', NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2020-07-29 18:52:01', NULL, NULL, 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1288427507118542849', 'f0675b52d89100ee88472b6800754a08', '每周一统计', '/ireport/statisticsList', 'report/StatisticsList', NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2020-07-29 18:53:50', NULL, NULL, 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1288429184416518145', 'f0675b52d89100ee88472b6800754a08', '单位每人体温分布', '/ireport/companyList', 'report/CompanyList', NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2020-07-29 19:00:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1288431684821487618', NULL, '手环管理', '/bracelet', 'layouts/RouteView', NULL, NULL, 0, NULL, '1', 1.00, 0, 'windows', 1, 0, 0, 0, NULL, 'admin', '2020-07-29 19:10:26', NULL, NULL, 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1288431899171393537', '1288431684821487618', '手环统计', '/ibracelet/braceletList', 'bracelet/BraceletList', NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2020-07-29 19:11:17', NULL, NULL, 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('190c2b43bec6a5f7a4194a85db67d96a', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '角色管理', '/isystem/roleUserList', 'system/RoleUserList', NULL, NULL, 1, NULL, NULL, 1.20, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-04-17 15:13:56', 'admin', '2019-12-25 09:36:31', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('1a0811914300741f4e11838ff37a1d3a', '3f915b2769fc80648e92d04e84ca059d', '手机号禁用', NULL, NULL, NULL, NULL, 2, 'user:form:phone', '2', 1.00, 0, NULL, 0, 1, NULL, 0, NULL, 'admin', '2019-05-11 17:19:30', 'admin', '2019-05-11 18:00:22', 0, 0, '1', NULL);
INSERT INTO `sys_permission` VALUES ('2aeddae571695cd6380f6d6d334d6e7d', 'f0675b52d89100ee88472b6800754a08', '温度分布图', '/ireport/distributionList', 'report/DistributionlList', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-04-03 18:32:48', 'admin', '2020-07-29 18:55:04', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('3f915b2769fc80648e92d04e84ca059d', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '用户管理', '/isystem/user', 'system/UserList', NULL, NULL, 1, NULL, NULL, 1.10, 0, NULL, 1, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-12-25 09:36:24', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('45c966826eeff4c99b8f8ebfe74511fc', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '公司管理', '/isystem/depart', 'system/DepartList', NULL, NULL, 1, NULL, NULL, 1.40, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-01-29 18:47:40', 'admin', '2020-07-29 16:11:44', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('54dd5457a3190740005c1bfec55b1c34', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '菜单管理', '/isystem/permission', 'system/PermissionList', NULL, NULL, 1, NULL, NULL, 1.30, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-12-25 09:36:39', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('5c2f42277948043026b7a14692456828', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '我的部门', '/isystem/departUserList', 'system/DepartUserList', NULL, NULL, 1, NULL, NULL, 2.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-04-17 15:12:24', 'admin', '2019-12-25 09:35:26', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('7593c9e3523a17bca83b8d7fe8a34e58', '3f915b2769fc80648e92d04e84ca059d', '添加用户按钮', '', NULL, NULL, NULL, 2, 'user:add', '1', 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-03-16 11:20:33', 'admin', '2019-05-17 18:31:25', 0, 0, '1', NULL);
INSERT INTO `sys_permission` VALUES ('9502685863ab87f0ad1134142788a385', '', '首页', '/dashboard/analysis', 'dashboard/Analysis', NULL, NULL, 0, NULL, NULL, 0.00, 0, 'home', 1, 1, NULL, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-03-29 11:04:13', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('9cb91b8851db0cf7b19d7ecc2a8193dd', '1939e035e803a99ceecb6f5563570fb2', '我的任务表单', '/modules/bpm/task/form/FormModule', 'modules/bpm/task/form/FormModule', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-03-08 16:49:05', 'admin', '2019-03-08 18:37:56', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('b6bcee2ccc854052d3cc3e9c96d90197', '71102b3b87fb07e5527bbd2c530dd90a', '加班申请', '/modules/extbpm/joa/JoaOvertimeList', 'modules/extbpm/joa/JoaOvertimeList', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-03 15:33:10', 'admin', '2019-04-03 15:34:48', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('d7d6e2e4e2934f2c9385a623fd98c6f3', '', '系统管理', '/isystem', 'layouts/RouteView', NULL, NULL, 0, NULL, NULL, 4.00, 0, 'setting', 1, 0, NULL, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-03-31 22:19:52', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('e08cb190ef230d5d4f03824198773950', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '系统通告', '/isystem/annountCement', 'system/SysAnnouncementList', NULL, NULL, 1, 'annountCement', NULL, 6.00, NULL, '', 1, 1, NULL, NULL, NULL, NULL, '2019-01-02 17:23:01', NULL, '2019-01-02 17:31:23', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('ebb9d82ea16ad864071158e0c449d186', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '分类字典', '/isys/category', 'system/SysCategoryList', NULL, NULL, 1, NULL, '1', 5.20, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-05-29 18:48:07', 'admin', '2020-02-23 22:45:33', 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('f0675b52d89100ee88472b6800754a08', '', '统计报表', '/report', 'layouts/RouteView', NULL, NULL, 0, NULL, NULL, 1.00, 0, 'bar-chart', 1, 0, NULL, 0, NULL, 'admin', '2019-04-03 18:32:02', 'admin', '2019-05-19 18:34:13', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('f1cb187abf927c88b89470d08615f5ac', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '数据字典', '/isystem/dict', 'system/DictList', NULL, NULL, 1, NULL, NULL, 5.00, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2018-12-28 13:54:43', 'admin', '2020-02-23 22:45:25', 0, 0, NULL, 0);

-- ----------------------------
-- Table structure for sys_permission_data_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission_data_rule`;
CREATE TABLE `sys_permission_data_rule`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `permission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单ID',
  `rule_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `rule_column` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段',
  `rule_conditions` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条件',
  `rule_value` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则值',
  `status` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限有效状态1有0否',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_fucntionid`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission_data_rule
-- ----------------------------
INSERT INTO `sys_permission_data_rule` VALUES ('40283181614231d401614234fe670003', '40283181614231d401614232cd1c0001', 'createBy', 'createBy', '=', '#{sys_user_code}', '1', '2018-01-29 21:57:04', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('4028318161424e730161424fca6f0004', '4028318161424e730161424f61510002', 'createBy', 'createBy', '=', '#{sys_user_code}', '1', '2018-01-29 22:26:20', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402880e6487e661a01487e732c020005', '402889fb486e848101486e93a7c80014', 'SYS_ORG_CODE', 'SYS_ORG_CODE', 'LIKE', '010201%', '1', '2014-09-16 20:32:30', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402880e6487e661a01487e8153ee0007', '402889fb486e848101486e93a7c80014', 'create_by', 'create_by', '', '#{SYS_USER_CODE}', '1', '2014-09-16 20:47:57', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402880ec5ddec439015ddf9225060038', '40288088481d019401481d2fcebf000d', '复杂关系', '', 'USE_SQL_RULES', 'name like \'%张%\' or age > 10', '1', NULL, NULL, '2017-08-14 15:10:25', 'demo');
INSERT INTO `sys_permission_data_rule` VALUES ('402880ec5ddfdd26015ddfe3e0570011', '4028ab775dca0d1b015dca3fccb60016', '复杂sql配置', '', 'USE_SQL_RULES', 'table_name like \'%test%\' or is_tree = \'Y\'', '1', NULL, NULL, '2017-08-14 16:38:55', 'demo');
INSERT INTO `sys_permission_data_rule` VALUES ('402880f25b1e2ac7015b1e5fdebc0012', '402880f25b1e2ac7015b1e5cdc340010', '只能看自己数据', 'create_by', '=', '#{sys_user_code}', '1', '2017-03-30 16:40:51', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402881875b19f141015b19f8125e0014', '40288088481d019401481d2fcebf000d', '可看下属业务数据', 'sys_org_code', 'LIKE', '#{sys_org_code}', '1', NULL, NULL, '2017-08-14 15:04:32', 'demo');
INSERT INTO `sys_permission_data_rule` VALUES ('402881e45394d66901539500a4450001', '402881e54df73c73014df75ab670000f', 'sysCompanyCode', 'sysCompanyCode', '=', '#{SYS_COMPANY_CODE}', '1', '2016-03-21 01:09:21', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402881e45394d6690153950177cb0003', '402881e54df73c73014df75ab670000f', 'sysOrgCode', 'sysOrgCode', '=', '#{SYS_ORG_CODE}', '1', '2016-03-21 01:10:15', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402881e56266f43101626727aff60067', '402881e56266f43101626724eb730065', '销售自己看自己的数据', 'createBy', '=', '#{sys_user_code}', '1', '2018-03-27 19:11:16', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402881e56266f4310162672fb1a70082', '402881e56266f43101626724eb730065', '销售经理看所有下级数据', 'sysOrgCode', 'LIKE', '#{sys_org_code}', '1', '2018-03-27 19:20:01', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402881e56266f431016267387c9f0088', '402881e56266f43101626724eb730065', '只看金额大于1000的数据', 'money', '>=', '1000', '1', '2018-03-27 19:29:37', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402881f3650de25101650dfb5a3a0010', '402881e56266f4310162671d62050044', '22', '', 'USE_SQL_RULES', '22', '1', '2018-08-06 14:45:01', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402889fb486e848101486e913cd6000b', '402889fb486e848101486e8e2e8b0007', 'userName', 'userName', '=', 'admin', '1', '2014-09-13 18:31:25', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402889fb486e848101486e98d20d0016', '402889fb486e848101486e93a7c80014', 'title', 'title', '=', '12', '1', NULL, NULL, '2014-09-13 22:18:22', 'scott');
INSERT INTO `sys_permission_data_rule` VALUES ('402889fe47fcb29c0147fcb6b6220001', '8a8ab0b246dc81120146dc8180fe002b', '12', '12', '>', '12', '1', '2014-08-22 15:55:38', '8a8ab0b246dc81120146dc8181950052', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('4028ab775dca0d1b015dca4183530018', '4028ab775dca0d1b015dca3fccb60016', '表名限制', 'isDbSynch', '=', 'Y', '1', NULL, NULL, '2017-08-14 16:43:45', 'demo');
INSERT INTO `sys_permission_data_rule` VALUES ('4028ef815595a881015595b0ccb60001', '40288088481d019401481d2fcebf000d', '限只能看自己', 'create_by', '=', '#{sys_user_code}', '1', NULL, NULL, '2017-08-14 15:03:56', 'demo');
INSERT INTO `sys_permission_data_rule` VALUES ('4028ef81574ae99701574aed26530005', '4028ef81574ae99701574aeb97bd0003', '用户名', 'userName', '!=', 'admin', '1', '2016-09-21 12:07:18', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('f852d85d47f224990147f2284c0c0005', NULL, '小于', 'test', '<=', '11', '1', '2014-08-20 14:43:52', '8a8ab0b246dc81120146dc8181950052', NULL, NULL);

-- ----------------------------
-- Table structure for sys_position
-- ----------------------------
DROP TABLE IF EXISTS `sys_position`;
CREATE TABLE `sys_position`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务编码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务名称',
  `post_rank` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职级',
  `company_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司id',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `sys_org_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_position
-- ----------------------------
INSERT INTO `sys_position` VALUES ('1185040064792571906', 'devleader', '研发部经理', '2', NULL, 'admin', '2019-10-18 11:49:03', 'admin', '2020-02-23 22:55:42', 'A01');
INSERT INTO `sys_position` VALUES ('1256485574212153345', '总经理', 'laozong', '5', NULL, 'admin', '2020-05-02 15:28:00', 'admin', '2020-05-02 15:28:03', '北京国炬公司');

-- ----------------------------
-- Table structure for sys_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_quartz_job`;
CREATE TABLE `sys_quartz_job`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `del_flag` int(1) NULL DEFAULT NULL COMMENT '删除状态',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `job_class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务类名',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `parameter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态 0正常 -1停止',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_job_class_name`(`job_class_name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_quartz_job
-- ----------------------------
INSERT INTO `sys_quartz_job` VALUES ('df26ecacf0f75d219d746750fe84bbee', NULL, NULL, 0, 'admin', '2020-05-02 15:40:35', 'org.jeecg.modules.quartz.job.SampleParamJob', '0/1 * * * * ?', 'scott', '带参测试 后台将每隔1秒执行输出日志', -1);
INSERT INTO `sys_quartz_job` VALUES ('a253cdfc811d69fa0efc70d052bc8128', 'admin', '2019-03-30 12:44:48', 0, 'admin', '2020-05-02 15:48:49', 'org.jeecg.modules.quartz.job.SampleJob', '0/1 * * * * ?', NULL, NULL, -1);
INSERT INTO `sys_quartz_job` VALUES ('5b3d2c087ad41aa755fc4f89697b01e7', 'admin', '2019-04-11 19:04:21', 0, 'admin', '2020-05-02 15:48:48', 'org.jeecg.modules.message.job.SendMsgJob', '0/50 * * * * ? *', NULL, NULL, -1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `role_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_sys_role_role_code`(`role_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1169504891467464705', '第三方登录角色', 'third_role', '第三方登录角色', 'admin', '2019-09-05 14:57:49', 'admin', '2020-05-02 18:20:58');
INSERT INTO `sys_role` VALUES ('e51758fa916c881624b046d26bd09230', '人力资源部', 'hr', NULL, 'admin', '2019-01-21 18:07:24', 'admin', '2019-10-18 11:39:43');
INSERT INTO `sys_role` VALUES ('ee8626f80f7c2619917b6236f3a7f02b', '临时角色', 'test', '这是新建的临时角色123', NULL, '2018-12-20 10:59:04', 'admin', '2019-02-19 15:08:37');
INSERT INTO `sys_role` VALUES ('f6817f48af4fb3af11b9e8bf182f618b', '管理员', 'admin', '管理员', NULL, '2018-12-21 18:03:39', 'admin', '2019-05-20 11:40:26');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `permission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限id',
  `data_rule_ids` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_group_role_per_id`(`role_id`, `permission_id`) USING BTREE,
  INDEX `index_group_role_id`(`role_id`) USING BTREE,
  INDEX `index_group_per_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('00b0748f04d3ea52c8cfa179c1c9d384', '52b0cf022ac4187b2a70dfa4f8b2d940', 'd7d6e2e4e2934f2c9385a623fd98c6f3', NULL);
INSERT INTO `sys_role_permission` VALUES ('0dec36b68c234767cd35466efef3b941', 'ee8626f80f7c2619917b6236f3a7f02b', '54dd5457a3190740005c1bfec55b1c34', NULL);
INSERT INTO `sys_role_permission` VALUES ('105c2ac10741e56a618a82cd58c461d7', 'e51758fa916c881624b046d26bd09230', '1663f3faba244d16c94552f849627d84', NULL);
INSERT INTO `sys_role_permission` VALUES ('115a6673ae6c0816d3f60de221520274', '21c5a3187763729408b40afb0d0fdfa8', '63b551e81c5956d5c861593d366d8c57', NULL);
INSERT INTO `sys_role_permission` VALUES ('1185039870491439105', 'f6817f48af4fb3af11b9e8bf182f618b', '1174506953255182338', NULL);
INSERT INTO `sys_role_permission` VALUES ('1185039870529187841', 'f6817f48af4fb3af11b9e8bf182f618b', '1174590283938041857', NULL);
INSERT INTO `sys_role_permission` VALUES ('1209423580355481602', 'f6817f48af4fb3af11b9e8bf182f618b', '190c2b43bec6a5f7a4194a85db67d96a', NULL);
INSERT INTO `sys_role_permission` VALUES ('1232123957949304833', 'ee8626f80f7c2619917b6236f3a7f02b', 'f0675b52d89100ee88472b6800754a08', NULL);
INSERT INTO `sys_role_permission` VALUES ('1232123957978664963', 'ee8626f80f7c2619917b6236f3a7f02b', '020b06793e4de2eee0007f603000c769', NULL);
INSERT INTO `sys_role_permission` VALUES ('1232123957987053570', 'ee8626f80f7c2619917b6236f3a7f02b', '2aeddae571695cd6380f6d6d334d6e7d', NULL);
INSERT INTO `sys_role_permission` VALUES ('126ea9faebeec2b914d6d9bef957afb6', 'f6817f48af4fb3af11b9e8bf182f618b', 'f1cb187abf927c88b89470d08615f5ac', NULL);
INSERT INTO `sys_role_permission` VALUES ('1288428680160514049', 'f6817f48af4fb3af11b9e8bf182f618b', '1288427049394147330', NULL);
INSERT INTO `sys_role_permission` VALUES ('1288428680185679873', 'f6817f48af4fb3af11b9e8bf182f618b', '1288427507118542849', NULL);
INSERT INTO `sys_role_permission` VALUES ('1288429217417302017', 'f6817f48af4fb3af11b9e8bf182f618b', '1288429184416518145', NULL);
INSERT INTO `sys_role_permission` VALUES ('1288431969509871618', 'f6817f48af4fb3af11b9e8bf182f618b', '1288431684821487618', NULL);
INSERT INTO `sys_role_permission` VALUES ('1288431969518260225', 'f6817f48af4fb3af11b9e8bf182f618b', '1288431899171393537', NULL);
INSERT INTO `sys_role_permission` VALUES ('1288432984367861761', 'f6817f48af4fb3af11b9e8bf182f618b', '9502685863ab87f0ad1134142788a385', NULL);
INSERT INTO `sys_role_permission` VALUES ('16ef8ed3865ccc6f6306200760896c50', 'ee8626f80f7c2619917b6236f3a7f02b', 'e8af452d8948ea49d37c934f5100ae6a', NULL);
INSERT INTO `sys_role_permission` VALUES ('17ead5b7d97ed365398ab20009a69ea3', '52b0cf022ac4187b2a70dfa4f8b2d940', 'e08cb190ef230d5d4f03824198773950', NULL);
INSERT INTO `sys_role_permission` VALUES ('1ac1688ef8456f384091a03d88a89ab1', '52b0cf022ac4187b2a70dfa4f8b2d940', '693ce69af3432bd00be13c3971a57961', NULL);
INSERT INTO `sys_role_permission` VALUES ('1af4babaa4227c3cbb830bc5eb513abb', 'ee8626f80f7c2619917b6236f3a7f02b', 'e08cb190ef230d5d4f03824198773950', NULL);
INSERT INTO `sys_role_permission` VALUES ('1e47db875601fd97723254046b5bba90', 'f6817f48af4fb3af11b9e8bf182f618b', 'baf16b7174bd821b6bab23fa9abb200d', NULL);
INSERT INTO `sys_role_permission` VALUES ('1fe4d408b85f19618c15bcb768f0ec22', '1750a8fb3e6d90cb7957c02de1dc8e59', '9502685863ab87f0ad1134142788a385', NULL);
INSERT INTO `sys_role_permission` VALUES ('248d288586c6ff3bd14381565df84163', '52b0cf022ac4187b2a70dfa4f8b2d940', '3f915b2769fc80648e92d04e84ca059d', NULL);
INSERT INTO `sys_role_permission` VALUES ('27489816708b18859768dfed5945c405', 'a799c3b1b12dd3ed4bd046bfaef5fe6e', '9502685863ab87f0ad1134142788a385', NULL);
INSERT INTO `sys_role_permission` VALUES ('2779cdea8367fff37db26a42c1a1f531', 'f6817f48af4fb3af11b9e8bf182f618b', 'fef097f3903caf3a3c3a6efa8de43fbb', NULL);
INSERT INTO `sys_role_permission` VALUES ('296f9c75ca0e172ae5ce4c1022c996df', '646c628b2b8295fbdab2d34044de0354', '732d48f8e0abe99fe6a23d18a3171cd1', NULL);
INSERT INTO `sys_role_permission` VALUES ('2c462293cbb0eab7e8ae0a3600361b5f', '52b0cf022ac4187b2a70dfa4f8b2d940', '9502685863ab87f0ad1134142788a385', NULL);
INSERT INTO `sys_role_permission` VALUES ('326181da3248a62a05e872119a462be1', 'ee8626f80f7c2619917b6236f3a7f02b', '3f915b2769fc80648e92d04e84ca059d', NULL);
INSERT INTO `sys_role_permission` VALUES ('38a2e55db0960262800576e34b3af44c', 'f6817f48af4fb3af11b9e8bf182f618b', '5c2f42277948043026b7a14692456828', NULL);
INSERT INTO `sys_role_permission` VALUES ('3de2a60c7e42a521fecf6fcc5cb54978', 'f6817f48af4fb3af11b9e8bf182f618b', '2d83d62bd2544b8994c8f38cf17b0ddf', NULL);
INSERT INTO `sys_role_permission` VALUES ('412e2de37a35b3442d68db8dd2f3c190', '52b0cf022ac4187b2a70dfa4f8b2d940', 'f1cb187abf927c88b89470d08615f5ac', NULL);
INSERT INTO `sys_role_permission` VALUES ('4204f91fb61911ba8ce40afa7c02369f', 'f6817f48af4fb3af11b9e8bf182f618b', '3f915b2769fc80648e92d04e84ca059d', NULL);
INSERT INTO `sys_role_permission` VALUES ('439568ff7db6f329bf6dd45b3dfc9456', 'f6817f48af4fb3af11b9e8bf182f618b', '7593c9e3523a17bca83b8d7fe8a34e58', NULL);
INSERT INTO `sys_role_permission` VALUES ('445656dd187bd8a71605f4bbab1938a3', 'f6817f48af4fb3af11b9e8bf182f618b', '020b06793e4de2eee0007f603000c769', NULL);
INSERT INTO `sys_role_permission` VALUES ('4dab5a06acc8ef3297889872caa74747', 'f6817f48af4fb3af11b9e8bf182f618b', 'ffb423d25cc59dcd0532213c4a518261', NULL);
INSERT INTO `sys_role_permission` VALUES ('4f254549d9498f06f4cc9b23f3e2c070', 'f6817f48af4fb3af11b9e8bf182f618b', '93d5cfb4448f11e9916698e7f462b4b6', NULL);
INSERT INTO `sys_role_permission` VALUES ('4f2fd4a190db856e21476de2704bbd99', 'f6817f48af4fb3af11b9e8bf182f618b', '1a0811914300741f4e11838ff37a1d3a', NULL);
INSERT INTO `sys_role_permission` VALUES ('4faad8ff93cb2b5607cd3d07c1b624ee', 'a799c3b1b12dd3ed4bd046bfaef5fe6e', '70b8f33da5f39de1981bf89cf6c99792', NULL);
INSERT INTO `sys_role_permission` VALUES ('504e326de3f03562cdd186748b48a8c7', 'f6817f48af4fb3af11b9e8bf182f618b', '027aee69baee98a0ed2e01806e89c891', NULL);
INSERT INTO `sys_role_permission` VALUES ('57c0b3a547b815ea3ec8e509b08948b3', '1750a8fb3e6d90cb7957c02de1dc8e59', '3f915b2769fc80648e92d04e84ca059d', NULL);
INSERT INTO `sys_role_permission` VALUES ('5de6871fadb4fe1cdd28989da0126b07', 'f6817f48af4fb3af11b9e8bf182f618b', 'a400e4f4d54f79bf5ce160a3432231af', NULL);
INSERT INTO `sys_role_permission` VALUES ('5e74637c4bec048d1880ad0bd1b00552', 'e51758fa916c881624b046d26bd09230', 'a400e4f4d54f79bf5ce160a3432231af', NULL);
INSERT INTO `sys_role_permission` VALUES ('5fc194b709336d354640fe29fefd65a3', 'a799c3b1b12dd3ed4bd046bfaef5fe6e', '9ba60e626bf2882c31c488aba62b89f0', NULL);
INSERT INTO `sys_role_permission` VALUES ('61835e48f3e675f7d3f5c9dd3a10dcf3', 'f6817f48af4fb3af11b9e8bf182f618b', 'f0675b52d89100ee88472b6800754a08', NULL);
INSERT INTO `sys_role_permission` VALUES ('6daddafacd7eccb91309530c17c5855d', 'f6817f48af4fb3af11b9e8bf182f618b', 'edfa74d66e8ea63ea432c2910837b150', NULL);
INSERT INTO `sys_role_permission` VALUES ('737d35f582036cd18bfd4c8e5748eaa4', 'e51758fa916c881624b046d26bd09230', '693ce69af3432bd00be13c3971a57961', NULL);
INSERT INTO `sys_role_permission` VALUES ('7413acf23b56c906aedb5a36fb75bd3a', 'f6817f48af4fb3af11b9e8bf182f618b', 'a4fc7b64b01a224da066bb16230f9c5a', NULL);
INSERT INTO `sys_role_permission` VALUES ('75002588591820806', '16457350655250432', '5129710648430592', NULL);
INSERT INTO `sys_role_permission` VALUES ('75002588604403712', '16457350655250432', '5129710648430593', NULL);
INSERT INTO `sys_role_permission` VALUES ('75002588612792320', '16457350655250432', '40238597734928384', NULL);
INSERT INTO `sys_role_permission` VALUES ('75002588625375232', '16457350655250432', '57009744761589760', NULL);
INSERT INTO `sys_role_permission` VALUES ('75002588633763840', '16457350655250432', '16392452747300864', NULL);
INSERT INTO `sys_role_permission` VALUES ('75002588637958144', '16457350655250432', '16392767785668608', NULL);
INSERT INTO `sys_role_permission` VALUES ('75002588650541056', '16457350655250432', '16439068543946752', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277779875336192', '496138616573952', '5129710648430592', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780043108352', '496138616573952', '5129710648430593', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780055691264', '496138616573952', '15701400130424832', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780064079872', '496138616573952', '16678126574637056', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780072468480', '496138616573952', '15701915807518720', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780076662784', '496138616573952', '15708892205944832', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780085051392', '496138616573952', '16678447719911424', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780089245696', '496138616573952', '25014528525733888', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780097634304', '496138616573952', '56898976661639168', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780135383040', '496138616573952', '40238597734928384', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780139577344', '496138616573952', '45235621697949696', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780147965952', '496138616573952', '45235787867885568', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780156354560', '496138616573952', '45235939278065664', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780164743168', '496138616573952', '43117268627886080', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780168937472', '496138616573952', '45236734832676864', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780181520384', '496138616573952', '45237010692050944', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780189908992', '496138616573952', '45237170029465600', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780198297600', '496138616573952', '57009544286441472', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780206686208', '496138616573952', '57009744761589760', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780215074816', '496138616573952', '57009981228060672', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780219269120', '496138616573952', '56309618086776832', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780227657728', '496138616573952', '57212882168844288', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780236046336', '496138616573952', '61560041605435392', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780244434944', '496138616573952', '61560275261722624', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780257017856', '496138616573952', '61560480518377472', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780265406464', '496138616573952', '44986029924421632', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780324126720', '496138616573952', '45235228800716800', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780332515328', '496138616573952', '45069342940860416', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780340903937', '496138616573952', '5129710648430594', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780349292544', '496138616573952', '16687383932047360', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780357681152', '496138616573952', '16689632049631232', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780366069760', '496138616573952', '16689745006432256', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780370264064', '496138616573952', '16689883993083904', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780374458369', '496138616573952', '16690313745666048', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780387041280', '496138616573952', '5129710648430595', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780395429888', '496138616573952', '16694861252005888', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780403818496', '496138616573952', '16695107491205120', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780412207104', '496138616573952', '16695243126607872', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780420595712', '496138616573952', '75002207560273920', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780428984320', '496138616573952', '76215889006956544', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780433178624', '496138616573952', '76216071333351424', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780441567232', '496138616573952', '76216264070008832', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780449955840', '496138616573952', '76216459709124608', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780458344448', '496138616573952', '76216594207870976', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780466733056', '496138616573952', '76216702639017984', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780475121664', '496138616573952', '58480609315524608', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780483510272', '496138616573952', '61394706252173312', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780491898880', '496138616573952', '61417744146370560', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780496093184', '496138616573952', '76606430504816640', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780504481792', '496138616573952', '76914082455752704', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780508676097', '496138616573952', '76607201262702592', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780517064704', '496138616573952', '39915540965232640', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780525453312', '496138616573952', '41370251991977984', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780538036224', '496138616573952', '45264987354042368', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780546424832', '496138616573952', '45265487029866496', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780554813440', '496138616573952', '45265762415284224', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780559007744', '496138616573952', '45265886315024384', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780567396352', '496138616573952', '45266070000373760', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780571590656', '496138616573952', '41363147411427328', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780579979264', '496138616573952', '41363537456533504', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780588367872', '496138616573952', '41364927394353152', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780596756480', '496138616573952', '41371711400054784', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780605145088', '496138616573952', '41469219249852416', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780613533696', '496138616573952', '39916171171991552', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780621922304', '496138616573952', '39918482854252544', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780630310912', '496138616573952', '41373430515240960', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780718391296', '496138616573952', '41375330996326400', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780722585600', '496138616573952', '63741744973352960', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780730974208', '496138616573952', '42082442672082944', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780739362816', '496138616573952', '41376192166629376', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780747751424', '496138616573952', '41377034236071936', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780756140032', '496138616573952', '56911328312299520', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780764528640', '496138616573952', '41378916912336896', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780768722944', '496138616573952', '63482475359244288', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780772917249', '496138616573952', '64290663792906240', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780785500160', '496138616573952', '66790433014943744', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780789694464', '496138616573952', '42087054753927168', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780798083072', '496138616573952', '67027338952445952', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780806471680', '496138616573952', '67027909637836800', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780810665985', '496138616573952', '67042515441684480', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780823248896', '496138616573952', '67082402312228864', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780827443200', '496138616573952', '16392452747300864', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780835831808', '496138616573952', '16392767785668608', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780840026112', '496138616573952', '16438800255291392', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780844220417', '496138616573952', '16438962738434048', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780852609024', '496138616573952', '16439068543946752', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860062040064', '496138616573953', '5129710648430592', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860070428672', '496138616573953', '5129710648430593', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860078817280', '496138616573953', '40238597734928384', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860091400192', '496138616573953', '43117268627886080', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860099788800', '496138616573953', '57009744761589760', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860112371712', '496138616573953', '56309618086776832', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860120760320', '496138616573953', '44986029924421632', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860129148928', '496138616573953', '5129710648430594', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860141731840', '496138616573953', '5129710648430595', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860150120448', '496138616573953', '75002207560273920', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860158509056', '496138616573953', '58480609315524608', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860162703360', '496138616573953', '76606430504816640', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860171091968', '496138616573953', '76914082455752704', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860179480576', '496138616573953', '76607201262702592', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860187869184', '496138616573953', '39915540965232640', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860196257792', '496138616573953', '41370251991977984', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860204646400', '496138616573953', '41363147411427328', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860208840704', '496138616573953', '41371711400054784', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860213035009', '496138616573953', '39916171171991552', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860221423616', '496138616573953', '39918482854252544', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860225617920', '496138616573953', '41373430515240960', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860234006528', '496138616573953', '41375330996326400', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860242395136', '496138616573953', '63741744973352960', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860250783744', '496138616573953', '42082442672082944', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860254978048', '496138616573953', '41376192166629376', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860263366656', '496138616573953', '41377034236071936', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860271755264', '496138616573953', '56911328312299520', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860313698304', '496138616573953', '41378916912336896', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860322086912', '496138616573953', '63482475359244288', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860326281216', '496138616573953', '64290663792906240', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860334669824', '496138616573953', '66790433014943744', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860343058432', '496138616573953', '42087054753927168', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860347252736', '496138616573953', '67027338952445952', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860351447041', '496138616573953', '67027909637836800', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860359835648', '496138616573953', '67042515441684480', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860364029952', '496138616573953', '67082402312228864', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860368224256', '496138616573953', '16392452747300864', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860372418560', '496138616573953', '16392767785668608', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860376612865', '496138616573953', '16438800255291392', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860385001472', '496138616573953', '16438962738434048', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860389195776', '496138616573953', '16439068543946752', NULL);
INSERT INTO `sys_role_permission` VALUES ('7de42bdc0b8c5446b7d428c66a7abc12', '52b0cf022ac4187b2a70dfa4f8b2d940', '54dd5457a3190740005c1bfec55b1c34', NULL);
INSERT INTO `sys_role_permission` VALUES ('7e19d90cec0dd87aaef351b9ff8f4902', '646c628b2b8295fbdab2d34044de0354', 'f9d3f4f27653a71c52faa9fb8070fbe7', NULL);
INSERT INTO `sys_role_permission` VALUES ('7f862c47003eb20e8bad05f506371f92', 'ee8626f80f7c2619917b6236f3a7f02b', 'd7d6e2e4e2934f2c9385a623fd98c6f3', NULL);
INSERT INTO `sys_role_permission` VALUES ('84eac2f113c23737128fb099d1d1da89', 'f6817f48af4fb3af11b9e8bf182f618b', '03dc3d93261dda19fc86dd7ca486c6cf', NULL);
INSERT INTO `sys_role_permission` VALUES ('86060e2867a5049d8a80d9fe5d8bc28b', 'f6817f48af4fb3af11b9e8bf182f618b', '765dd244f37b804e3d00f475fd56149b', NULL);
INSERT INTO `sys_role_permission` VALUES ('8a60df8d8b4c9ee5fa63f48aeee3ec00', '1750a8fb3e6d90cb7957c02de1dc8e59', 'd7d6e2e4e2934f2c9385a623fd98c6f3', NULL);
INSERT INTO `sys_role_permission` VALUES ('8b09925bdc194ab7f3559cd3a7ea0507', 'f6817f48af4fb3af11b9e8bf182f618b', 'ebb9d82ea16ad864071158e0c449d186', NULL);
INSERT INTO `sys_role_permission` VALUES ('9264104cee9b10c96241d527b2d0346d', '1750a8fb3e6d90cb7957c02de1dc8e59', '54dd5457a3190740005c1bfec55b1c34', NULL);
INSERT INTO `sys_role_permission` VALUES ('980171fda43adfe24840959b1d048d4d', 'f6817f48af4fb3af11b9e8bf182f618b', 'd7d6e2e4e2934f2c9385a623fd98c6f3', NULL);
INSERT INTO `sys_role_permission` VALUES ('9d8772c310b675ae43eacdbc6c7fa04a', 'a799c3b1b12dd3ed4bd046bfaef5fe6e', '1663f3faba244d16c94552f849627d84', NULL);
INSERT INTO `sys_role_permission` VALUES ('9f8311ecccd44e079723098cf2ffe1cc', '1750a8fb3e6d90cb7957c02de1dc8e59', '693ce69af3432bd00be13c3971a57961', NULL);
INSERT INTO `sys_role_permission` VALUES ('a034ed7c38c996b880d3e78f586fe0ae', 'f6817f48af4fb3af11b9e8bf182f618b', 'c89018ea6286e852b424466fd92a2ffc', NULL);
INSERT INTO `sys_role_permission` VALUES ('a72c31a3913c736d4eca11d13be99183', 'e51758fa916c881624b046d26bd09230', 'a44c30db536349e91106223957e684eb', NULL);
INSERT INTO `sys_role_permission` VALUES ('abdc324a2df9f13ee6e73d44c6e62bc8', 'ee8626f80f7c2619917b6236f3a7f02b', 'f1cb187abf927c88b89470d08615f5ac', NULL);
INSERT INTO `sys_role_permission` VALUES ('acacce4417e5d7f96a9c3be2ded5b4be', 'f6817f48af4fb3af11b9e8bf182f618b', 'f9d3f4f27653a71c52faa9fb8070fbe7', NULL);
INSERT INTO `sys_role_permission` VALUES ('aefc8c22e061171806e59cd222f6b7e1', '52b0cf022ac4187b2a70dfa4f8b2d940', 'e8af452d8948ea49d37c934f5100ae6a', NULL);
INSERT INTO `sys_role_permission` VALUES ('b64c4ab9cd9a2ea8ac1e9db5fb7cf522', 'f6817f48af4fb3af11b9e8bf182f618b', '2aeddae571695cd6380f6d6d334d6e7d', NULL);
INSERT INTO `sys_role_permission` VALUES ('bea2986432079d89203da888d99b3f16', 'f6817f48af4fb3af11b9e8bf182f618b', '54dd5457a3190740005c1bfec55b1c34', NULL);
INSERT INTO `sys_role_permission` VALUES ('c8571839e6b14796e661f3e2843b80b6', 'ee8626f80f7c2619917b6236f3a7f02b', '45c966826eeff4c99b8f8ebfe74511fc', NULL);
INSERT INTO `sys_role_permission` VALUES ('ced80e43584ce15e97bb07298e93020d', 'e51758fa916c881624b046d26bd09230', '45c966826eeff4c99b8f8ebfe74511fc', NULL);
INSERT INTO `sys_role_permission` VALUES ('cf1feb1bf69eafc982295ad6c9c8d698', 'f6817f48af4fb3af11b9e8bf182f618b', 'a2b11669e98c5fe54a53c3e3c4f35d14', NULL);
INSERT INTO `sys_role_permission` VALUES ('d3fe195d59811531c05d31d8436f5c8b', '1750a8fb3e6d90cb7957c02de1dc8e59', 'e8af452d8948ea49d37c934f5100ae6a', NULL);
INSERT INTO `sys_role_permission` VALUES ('dbc5dd836d45c5bc7bc94b22596ab956', 'f6817f48af4fb3af11b9e8bf182f618b', '1939e035e803a99ceecb6f5563570fb2', NULL);
INSERT INTO `sys_role_permission` VALUES ('dc83bb13c0e8c930e79d28b2db26f01f', 'f6817f48af4fb3af11b9e8bf182f618b', '63b551e81c5956d5c861593d366d8c57', NULL);
INSERT INTO `sys_role_permission` VALUES ('dc8fd3f79bd85bd832608b42167a1c71', 'f6817f48af4fb3af11b9e8bf182f618b', '91c23960fab49335831cf43d820b0a61', NULL);
INSERT INTO `sys_role_permission` VALUES ('de82e89b8b60a3ea99be5348f565c240', 'f6817f48af4fb3af11b9e8bf182f618b', '56ca78fe0f22d815fabc793461af67b8', NULL);
INSERT INTO `sys_role_permission` VALUES ('e3e922673f4289b18366bb51b6200f17', '52b0cf022ac4187b2a70dfa4f8b2d940', '45c966826eeff4c99b8f8ebfe74511fc', NULL);
INSERT INTO `sys_role_permission` VALUES ('e7467726ee72235baaeb47df04a35e73', 'f6817f48af4fb3af11b9e8bf182f618b', 'e08cb190ef230d5d4f03824198773950', NULL);
INSERT INTO `sys_role_permission` VALUES ('ec846a3f85fdb6813e515be71f11b331', 'f6817f48af4fb3af11b9e8bf182f618b', '732d48f8e0abe99fe6a23d18a3171cd1', NULL);
INSERT INTO `sys_role_permission` VALUES ('ecdd72fe694e6bba9c1d9fc925ee79de', 'f6817f48af4fb3af11b9e8bf182f618b', '45c966826eeff4c99b8f8ebfe74511fc', NULL);
INSERT INTO `sys_role_permission` VALUES ('f177acac0276329dc66af0c9ad30558a', 'f6817f48af4fb3af11b9e8bf182f618b', 'c2c356bf4ddd29975347a7047a062440', NULL);
INSERT INTO `sys_role_permission` VALUES ('f17ab8ad1e71341140857ef4914ef297', '21c5a3187763729408b40afb0d0fdfa8', '732d48f8e0abe99fe6a23d18a3171cd1', NULL);
INSERT INTO `sys_role_permission` VALUES ('fafe73c4448b977fe42880a6750c3ee8', 'f6817f48af4fb3af11b9e8bf182f618b', '9cb91b8851db0cf7b19d7ecc2a8193dd', NULL);
INSERT INTO `sys_role_permission` VALUES ('fd86f6b08eb683720ba499f9d9421726', 'ee8626f80f7c2619917b6236f3a7f02b', '693ce69af3432bd00be13c3971a57961', NULL);

-- ----------------------------
-- Table structure for sys_sms
-- ----------------------------
DROP TABLE IF EXISTS `sys_sms`;
CREATE TABLE `sys_sms`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `es_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息标题',
  `es_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送方式：1短信 2邮件 3微信',
  `es_receiver` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收人',
  `es_param` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送所需参数Json格式',
  `es_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '推送内容',
  `es_send_time` datetime(0) NULL DEFAULT NULL COMMENT '推送时间',
  `es_send_status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推送状态 0未推送 1推送成功 2推送失败 -1失败不再发送',
  `es_send_num` int(11) NULL DEFAULT NULL COMMENT '发送次数 超过5次不再发送',
  `es_result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推送失败原因',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_type`(`es_type`) USING BTREE,
  INDEX `index_receiver`(`es_receiver`) USING BTREE,
  INDEX `index_sendtime`(`es_send_time`) USING BTREE,
  INDEX `index_status`(`es_send_status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_sms
-- ----------------------------
INSERT INTO `sys_sms` VALUES ('402880e74dc2f361014dc2f8411e0001', '消息推送测试333', '2', '411944058@qq.com', NULL, '张三你好，你的订单4028d881436d514601436d521ae80165已付款!', '2015-06-05 17:06:01', '3', NULL, NULL, '认证失败错误的用户名或者密码', 'admin', '2015-06-05 17:05:59', 'admin', '2015-11-19 22:30:39');
INSERT INTO `sys_sms` VALUES ('402880ea533647b00153364e74770001', '发个问候', '3', 'admin', NULL, '你好', '2016-03-02 00:00:00', '2', NULL, NULL, NULL, 'admin', '2016-03-02 15:50:24', 'admin', '2018-07-05 19:53:01');
INSERT INTO `sys_sms` VALUES ('402880ee5a17e711015a17f3188e013f', '消息推送测试333', '2', '411944058@qq.com', NULL, '张三你好，你的订单4028d881436d514601436d521ae80165已付款!', NULL, '2', NULL, NULL, NULL, 'admin', '2017-02-07 17:41:31', 'admin', '2017-03-10 11:37:05');
INSERT INTO `sys_sms` VALUES ('402880f05ab649b4015ab64b9cd80012', '消息推送测试333', '2', '411944058@qq.com', NULL, '张三你好，你的订单4028d881436d514601436d521ae80165已付款!', '2017-11-16 15:58:15', '3', NULL, NULL, NULL, 'admin', '2017-03-10 11:38:13', 'admin', '2017-07-31 17:24:54');
INSERT INTO `sys_sms` VALUES ('402880f05ab7b035015ab7c4462c0004', '消息推送测试333', '2', '411944058@qq.com', NULL, '张三你好，你的订单4028d881436d514601436d521ae80165已付款!', '2017-11-16 15:58:15', '3', NULL, NULL, NULL, 'admin', '2017-03-10 18:29:37', NULL, NULL);
INSERT INTO `sys_sms` VALUES ('402881f3646a472b01646a4a5af00001', '催办：HR审批', '3', 'admin', NULL, 'admin，您好！\r\n请前待办任务办理事项！HR审批\r\n\r\n\r\n===========================\r\n此消息由系统发出', '2018-07-05 19:53:35', '2', NULL, NULL, NULL, 'admin', '2018-07-05 19:53:35', 'admin', '2018-07-07 13:45:24');
INSERT INTO `sys_sms` VALUES ('402881f3647da06c01647da43a940014', '催办：HR审批', '3', 'admin', NULL, 'admin，您好！\r\n请前待办任务办理事项！HR审批\r\n\r\n\r\n===========================\r\n此消息由系统发出', '2018-07-09 14:04:32', '2', NULL, NULL, NULL, 'admin', '2018-07-09 14:04:32', 'admin', '2018-07-09 18:51:30');

-- ----------------------------
-- Table structure for sys_sms_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_sms_template`;
CREATE TABLE `sys_sms_template`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `template_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板标题',
  `template_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板CODE',
  `template_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板类型：1短信 2邮件 3微信',
  `template_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板内容',
  `template_test_json` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板测试json',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_templatecode`(`template_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_sms_template
-- ----------------------------
INSERT INTO `sys_sms_template` VALUES ('1199606397416775681', '系统消息通知', 'sys_ts_note', '4', '<h1>&nbsp; &nbsp; 系统通知</h1>\n<ul>\n<li>通知时间：&nbsp; ${ts_date}</li>\n<li>通知内容：&nbsp; ${ts_content}</li>\n</ul>', NULL, '2019-11-27 16:30:27', 'admin', '2019-11-27 19:36:50', 'admin');
INSERT INTO `sys_sms_template` VALUES ('1199615897335095298', '流程催办', 'bpm_cuiban', '4', '<h1>&nbsp; &nbsp;流程催办提醒</h1>\n<ul>\n<li>流程名称：&nbsp; ${bpm_name}</li>\n<li>催办任务：&nbsp; ${bpm_task}</li>\n<li>催办时间 :&nbsp; &nbsp; ${datetime}</li>\n<li>催办内容 :&nbsp; &nbsp; ${remark}</li>\n</ul>', NULL, '2019-11-27 17:08:12', 'admin', '2019-11-27 19:36:45', 'admin');
INSERT INTO `sys_sms_template` VALUES ('1199648914107625473', '流程办理超时提醒', 'bpm_chaoshi_tip', '4', '<h1>&nbsp; &nbsp;流程办理超时提醒</h1>\n<ul>\n<li>&nbsp; &nbsp;超时提醒信息：&nbsp; &nbsp; 您有待处理的超时任务，请尽快处理！</li>\n<li>&nbsp; &nbsp;超时任务标题：&nbsp; &nbsp; ${title}</li>\n<li>&nbsp; &nbsp;超时任务节点：&nbsp; &nbsp; ${task}</li>\n<li>&nbsp; &nbsp;任务处理人：&nbsp; &nbsp; &nbsp; &nbsp;${user}</li>\n<li>&nbsp; &nbsp;任务开始时间：&nbsp; &nbsp; ${time}</li>\n</ul>', NULL, '2019-11-27 19:19:24', 'admin', '2019-11-27 19:36:37', 'admin');
INSERT INTO `sys_sms_template` VALUES ('4028608164691b000164693108140003', '催办：${taskName}', 'SYS001', '3', '${userName}，您好！\r\n请前待办任务办理事项！${taskName}\r\n\r\n\r\n===========================\r\n此消息由系统发出', '{\r\n\"taskName\":\"HR审批\",\r\n\"userName\":\"admin\"\r\n}', '2018-07-05 14:46:18', 'admin', '2018-07-05 18:31:34', 'admin');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'md5密码盐',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '性别(0-默认未知,1-男,2-女)',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `org_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构编码',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '性别(1-正常,2-冻结)',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除状态(0-正常,1-已删除)',
  `third_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方登录的唯一标识',
  `third_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方类型',
  `activiti_sync` tinyint(1) NULL DEFAULT NULL COMMENT '同步工作流引擎(1-同步,0-不同步)',
  `work_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号，唯一键',
  `post` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务，关联职务表',
  `telephone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座机号',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_identity` tinyint(1) NULL DEFAULT NULL COMMENT '身份（1普通成员 2上级）',
  `depart_ids` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '负责部门',
  `face_code` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人脸图片唯一编码',
  `face_group` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人脸所在分组',
  `face_exist` tinyint(1) NULL DEFAULT NULL COMMENT '是否上传过人脸图片(1否，2是)',
  `face_image_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人脸图片地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_user_name`(`username`) USING BTREE,
  UNIQUE INDEX `uniq_sys_user_work_no`(`work_no`) USING BTREE,
  UNIQUE INDEX `uniq_sys_user_username`(`username`) USING BTREE,
  UNIQUE INDEX `uniq_sys_user_phone`(`phone`) USING BTREE,
  UNIQUE INDEX `uniq_sys_user_email`(`email`) USING BTREE,
  INDEX `index_user_status`(`status`) USING BTREE,
  INDEX `index_user_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('a75d45a015c44384a04449ee80dc3503', 'jeecg', 'jeecg', '3dd8371f3cf8240e', 'vDDkDzrK', 'user/20190220/e1fe9925bc315c60addea1b98eb1cb1349547719_1550656892940.jpg', NULL, 1, NULL, NULL, '财务部', 1, 1, NULL, NULL, 1, '00002', 'devleader', NULL, 'admin', '2019-02-13 16:02:36', 'admin', '2020-05-02 15:34:30', 1, '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES ('ba8812b74f38469085ac008fbfca8896', '2072963877', '周高帆', '55ed671ab359dbd7702c4b5620439ce7', 'Ytz5SY17', 'temp/beauty_20200708130621_1596128118673.jpg', '2001-02-07 00:00:00', 1, '2072963877@qq.com', '15773413942', '研发部,北京卓尔互动', 1, 0, NULL, NULL, 1, '54088666', '总经理', NULL, 'admin', '2020-07-30 14:43:55', 'admin', '2020-07-31 01:23:42', 2, '6d35e179cd814e3299bd588ea7daed3f,5159cde220114246b045e574adceafe9', 'e79d9ac0e909f10a187f05ef6ccb74f2', '2020', 2, 'temp/SelfieCity_20200524210205_save_1596129801811.jpg');
INSERT INTO `sys_user` VALUES ('e9ca23d68d884d4ebb19d07889727dae', 'admin', '管理员', 'cb362cfeefbf3d8d', 'RCGTeGiH', 'http://minio.jeecg.com/otatest/temp/lgo33_1583397323099.png', '2018-12-05 00:00:00', 1, 'jeecg@163.com', '18611111111', 'A01', 1, 0, NULL, NULL, 1, '00001', '总经理', NULL, NULL, '2038-06-21 17:54:10', 'admin', '2020-05-02 18:19:41', 2, 'c6d7cb4deeac411cb3384b1b31278596', NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES ('f0019fdebedb443c98dcb17d88222c38', 'zhagnxiao', '张小红', 'f898134e5e52ae11a2ffb2c3b57a4e90', 'go3jJ4zX', 'user/20190401/20180607175028Fn1Lq7zw_1554118444672.png', '2019-04-01 00:00:00', NULL, NULL, NULL, '研发部,财务部', 1, 1, NULL, NULL, 1, '00003', '', NULL, 'admin', '2023-10-01 19:34:10', 'admin', '2020-05-02 15:34:51', 1, '', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_agent
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_agent`;
CREATE TABLE `sys_user_agent`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '序号',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `agent_user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理人用户名',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '代理开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '代理结束时间',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态0无效1有效',
  `create_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_username`(`user_name`) USING BTREE,
  INDEX `statux_index`(`status`) USING BTREE,
  INDEX `begintime_index`(`start_time`) USING BTREE,
  INDEX `endtime_index`(`end_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户代理人设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_depart
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_depart`;
CREATE TABLE `sys_user_depart`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `dep_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_depart_groupk_userid`(`user_id`) USING BTREE,
  INDEX `index_depart_groupkorgid`(`dep_id`) USING BTREE,
  INDEX `index_depart_groupk_uidanddid`(`user_id`, `dep_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_depart
-- ----------------------------
INSERT INTO `sys_user_depart` VALUES ('1256487210695356418', 'a75d45a015c44384a04449ee80dc3503', 'a7d7e77e06c84325a40932163adcdaa6');
INSERT INTO `sys_user_depart` VALUES ('1288888009103532033', 'ba8812b74f38469085ac008fbfca8896', '5159cde220114246b045e574adceafe9');
INSERT INTO `sys_user_depart` VALUES ('1288888009468436482', 'ba8812b74f38469085ac008fbfca8896', '6d35e179cd814e3299bd588ea7daed3f');
INSERT INTO `sys_user_depart` VALUES ('1f3a0267811327b9eca86b0cc2b956f3', 'bcbe1290783a469a83ae3bd8effe15d4', '5159cde220114246b045e574adceafe9');
INSERT INTO `sys_user_depart` VALUES ('1256528778500354050', 'e9ca23d68d884d4ebb19d07889727dae', 'c6d7cb4deeac411cb3384b1b31278596');
INSERT INTO `sys_user_depart` VALUES ('1256487300096946177', 'f0019fdebedb443c98dcb17d88222c38', '57197590443c44f083d42ae24ef26a2c');
INSERT INTO `sys_user_depart` VALUES ('1256487300122112001', 'f0019fdebedb443c98dcb17d88222c38', '67fc001af12a4f9b8458005d3f19934a');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index2_groupuu_user_id`(`user_id`) USING BTREE,
  INDEX `index2_groupuu_ole_id`(`role_id`) USING BTREE,
  INDEX `index2_groupuu_useridandroleid`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('b3ffd9311a1ca296c44e2409b547384f', '01b802058ea94b978a2c96f4807f6b48', '1');
INSERT INTO `sys_user_role` VALUES ('0ede6d23d53bc7dc990346ff14faabee', '3db4cf42353f4e868b7ccfeef90505d2', 'ee8626f80f7c2619917b6236f3a7f02b');
INSERT INTO `sys_user_role` VALUES ('e78d210d24aaff48e0a736e2ddff4cdc', '3e177fede453430387a8279ced685679', 'ee8626f80f7c2619917b6236f3a7f02b');
INSERT INTO `sys_user_role` VALUES ('f2de3ae7b5efd8345581aa802a6675d6', '41b1be8d4c52023b0798f51164ca682d', 'e51758fa916c881624b046d26bd09230');
INSERT INTO `sys_user_role` VALUES ('f2922a38ba24fb53749e45a0c459adb3', '439ae3e9bcf7418583fcd429cadb1d72', '1');
INSERT INTO `sys_user_role` VALUES ('f72c6190b0722e798147e73c776c6ac9', '439ae3e9bcf7418583fcd429cadb1d72', 'ee8626f80f7c2619917b6236f3a7f02b');
INSERT INTO `sys_user_role` VALUES ('ee45d0343ecec894b6886effc92cb0b7', '4d8fef4667574b24a9ccfedaf257810c', 'f6817f48af4fb3af11b9e8bf182f618b');
INSERT INTO `sys_user_role` VALUES ('be2639167ede09379937daca7fc3bb73', '526f300ab35e44faaed54a9fb0742845', 'ee8626f80f7c2619917b6236f3a7f02b');
INSERT INTO `sys_user_role` VALUES ('31af310584bd5795f76b1fe8c38294a0', '70f5dcf03f36471dabba81381919291f', 'e51758fa916c881624b046d26bd09230');
INSERT INTO `sys_user_role` VALUES ('8d7846ec783e157174e4ce2949231a65', '7ee6630e89d17afbf6d12150197b578d', 'e51758fa916c881624b046d26bd09230');
INSERT INTO `sys_user_role` VALUES ('79d66ef7aa137cfa9957081a1483009d', '9a668858c4c74cf5a2b25ad9608ba095', 'ee8626f80f7c2619917b6236f3a7f02b');
INSERT INTO `sys_user_role` VALUES ('1256487210544361473', 'a75d45a015c44384a04449ee80dc3503', 'ee8626f80f7c2619917b6236f3a7f02b');
INSERT INTO `sys_user_role` VALUES ('1288888008470192129', 'ba8812b74f38469085ac008fbfca8896', 'f6817f48af4fb3af11b9e8bf182f618b');
INSERT INTO `sys_user_role` VALUES ('1256528778294833153', 'e9ca23d68d884d4ebb19d07889727dae', 'f6817f48af4fb3af11b9e8bf182f618b');
INSERT INTO `sys_user_role` VALUES ('1256487299962728449', 'f0019fdebedb443c98dcb17d88222c38', 'ee8626f80f7c2619917b6236f3a7f02b');

-- ----------------------------
-- Table structure for test_enhance_select
-- ----------------------------
DROP TABLE IF EXISTS `test_enhance_select`;
CREATE TABLE `test_enhance_select`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `province` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `area` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_enhance_select
-- ----------------------------
INSERT INTO `test_enhance_select` VALUES ('1256614575282958338', '1230769290609725441', '1230769470889299970', '1230769620021972993', '2020-05-03 00:00:36', 'admin');
INSERT INTO `test_enhance_select` VALUES ('402880e570801ffe01708053743c002e', '1230769253267836929', '1230769769930592257', '1230769855347593217', '2020-02-26 15:08:37', 'admin');
INSERT INTO `test_enhance_select` VALUES ('402880e570801ffe017080538b24002f', '1230769290609725441', '1230769470889299970', '1230769620021972993', '2020-02-26 15:08:43', 'admin');
INSERT INTO `test_enhance_select` VALUES ('402880e570801ffe01708053b2b10030', '1230769253267836929', '1230769347157331969', '1230769407907631106', '2020-02-26 15:08:53', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
