/*
Navicat MySQL Data Transfer

Source Server         : 192.168.10.15
Source Server Version : 50639
Source Host           : 192.168.10.15:3306
Source Database       : scf_hengda

Target Server Type    : MYSQL
Target Server Version : 50639
File Encoding         : 65001

Date: 2019-03-20 09:43:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sc_financing_apply_file_ld
-- ----------------------------
DROP TABLE IF EXISTS `sc_financing_apply_file_ld`;
CREATE TABLE `sc_financing_apply_file_ld` (
  `id` varchar(18) NOT NULL COMMENT 'ID',
  `file_name` varchar(50) DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(200) DEFAULT NULL COMMENT '文件路径',
  `file_size` varchar(10) DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(8) DEFAULT NULL COMMENT '文件类型',
  `upload_time` timestamp NULL DEFAULT NULL COMMENT '上传时间',
  `is_vaild` varchar(5) DEFAULT NULL COMMENT '是否有效 01有效 02失效',
  `file_aliasing` varchar(25) DEFAULT NULL COMMENT '文件别名',
  `file_category` varchar(8) DEFAULT NULL COMMENT '文件类别 01应收账款转让通知书   05应收账款确认函,04签署回执单，06 应收账款对账单发票文件，07融资服务协议，08 供应商确认融资服务协议，\r\n09 应收账款转让协议',
  `fk_financing_apply_id` varchar(50) DEFAULT NULL COMMENT '文件关联融资申请id',
  `protocol_number` varchar(30) DEFAULT NULL COMMENT '协议编号（非签章文件不必填）',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `nonedel` char(1) DEFAULT '0' COMMENT '0:未删除 1:已删除',
  `remark` varchar(15) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商合同表';

-- ----------------------------
-- Table structure for sc_supply_schain_file_ld
-- ----------------------------
DROP TABLE IF EXISTS `sc_supply_schain_file_ld`;
CREATE TABLE `sc_supply_schain_file_ld` (
  `id` varchar(18) NOT NULL COMMENT 'ID',
  `file_name` varchar(50) DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(200) DEFAULT NULL COMMENT '文件路径',
  `file_size` varchar(10) DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(8) DEFAULT NULL COMMENT '文件类型',
  `upload_time` timestamp NULL DEFAULT NULL COMMENT '上传时间',
  `is_vaild` varchar(5) DEFAULT NULL,
  `file_aliasing` varchar(255) DEFAULT NULL,
  `file_category` varchar(2) DEFAULT NULL COMMENT '文件类别。00:营业执照 01:组织机构代码证 02:中证码 03:法人身份证正面 04:法人身份证背面 05:操作者身份证',
  `fk_supplier_detail_id` varchar(50) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `nonedel` char(1) DEFAULT '0' COMMENT '0:未删除 1:已删除',
  `remark` varchar(15) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商资料证件表';

-- ----------------------------
-- Table structure for scf_account_frozen_detail_ld
-- ----------------------------
DROP TABLE IF EXISTS `scf_account_frozen_detail_ld`;
CREATE TABLE `scf_account_frozen_detail_ld` (
  `id` varchar(18) NOT NULL,
  `transaction_date` varchar(8) DEFAULT NULL COMMENT '交易日期YYYYMMDD',
  `transaction_time` varchar(6) DEFAULT NULL COMMENT '交易时间HH24MISS',
  `serial_no` varchar(32) DEFAULT NULL COMMENT '交易流水号',
  `fund_no` varchar(24) DEFAULT NULL COMMENT '资金账号',
  `client_name` varchar(128) DEFAULT NULL COMMENT '户名',
  `amount` bigint(16) DEFAULT NULL COMMENT '发生额(资金单位:分',
  `usage` varchar(128) DEFAULT NULL COMMENT '资金用途(附言)',
  `trsflag` varchar(4) DEFAULT NULL COMMENT '冻结业务标示\\r\\nA00 冻结\\r\\nB00 解冻',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `nonedel` char(1) DEFAULT '0' COMMENT '0:未删除 1:已删除',
  `remark` varchar(15) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='冻解明细表';

-- ----------------------------
-- Table structure for scf_account_open_detail_ld
-- ----------------------------
DROP TABLE IF EXISTS `scf_account_open_detail_ld`;
CREATE TABLE `scf_account_open_detail_ld` (
  `id` varchar(18) NOT NULL,
  `fk_exclusive_account_id` varchar(32) DEFAULT NULL,
  `transaction_date` varchar(8) DEFAULT NULL,
  `transaction_time` varchar(6) DEFAULT NULL,
  `client_no` int(32) DEFAULT NULL COMMENT '客户号',
  `fund_no` int(24) DEFAULT NULL COMMENT '资金账号',
  `client_name` varchar(128) DEFAULT NULL COMMENT '户名',
  `client_type` varchar(2) DEFAULT NULL COMMENT '客户性质',
  `legal_person` varchar(128) DEFAULT NULL COMMENT '姓名 公司：法定代表人 个人：自然人',
  `legal_person_card_type` varchar(4) DEFAULT NULL COMMENT '法定代表人/自然人 证件类型',
  `legal_person_card_no` int(32) DEFAULT NULL COMMENT '法定代表人/自然人 证件号',
  `uscid` int(32) DEFAULT NULL COMMENT '统一社会信用代码',
  `mobile_no` int(24) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(126) DEFAULT NULL COMMENT '电子邮箱',
  `postno` int(6) DEFAULT NULL COMMENT '邮政编码',
  `address` varchar(192) DEFAULT NULL COMMENT '地址',
  `account_type` varchar(2) DEFAULT NULL COMMENT '账户类型',
  `account_state` varchar(6) DEFAULT NULL COMMENT '账号状态',
  `platform_client_no` int(32) DEFAULT NULL COMMENT '平台客户号',
  `bank_identification_no` int(64) DEFAULT NULL COMMENT '银行识别号',
  `bank_electronic_no` int(64) DEFAULT NULL COMMENT '银行电子账号（跨行收款\\r\\n账号）',
  `electronic_account_bank_id` int(12) DEFAULT NULL COMMENT '电子账户归属支行号',
  `electronic_account_bank_name` varchar(128) DEFAULT NULL COMMENT '电子账户归属支行名称',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `nonedel` char(1) DEFAULT '0' COMMENT '0:未删除 1:已删除',
  `remark` varchar(15) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='开户明细表';

-- ----------------------------
-- Table structure for scf_account_transfer_detail_ld
-- ----------------------------
DROP TABLE IF EXISTS `scf_account_transfer_detail_ld`;
CREATE TABLE `scf_account_transfer_detail_ld` (
  `id` varchar(18) NOT NULL,
  `transaction_date` varchar(8) DEFAULT NULL COMMENT '交易日期YYYYMMDD',
  `transaction_time` varchar(6) DEFAULT NULL COMMENT '交易时间HH24MISS',
  `serial_no` varchar(24) DEFAULT NULL COMMENT '交易流水号',
  `payer_fund_no` int(11) DEFAULT NULL COMMENT '付款方资金账号',
  `payer_client_name` varchar(128) DEFAULT NULL COMMENT '付款方户名',
  `receivable_fund_no` int(11) DEFAULT NULL COMMENT '收款方资金账号',
  `receivable_client_name` varchar(128) DEFAULT NULL COMMENT '收款方户名',
  `order_no` int(11) DEFAULT NULL COMMENT '业务单号',
  `bill_no` int(11) DEFAULT NULL COMMENT '支付单号',
  `payment_amount` varchar(16) DEFAULT NULL COMMENT '支付金额',
  `usage` varchar(128) DEFAULT NULL COMMENT '资金用途',
  `trsflag` varchar(6) DEFAULT NULL COMMENT '业务标示\\r\\nA00 普通订单支付\\r\\nB00 收款方收款成功后，再\\r\\n冻结资金\\r\\nB01 付款方解冻资金后，再\\r\\n支付给收款方',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `nonedel` char(1) DEFAULT '0' COMMENT '0:未删除 1:已删除',
  `remark` varchar(15) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for scf_account_withdraw_detail_ld
-- ----------------------------
DROP TABLE IF EXISTS `scf_account_withdraw_detail_ld`;
CREATE TABLE `scf_account_withdraw_detail_ld` (
  `id` varchar(18) NOT NULL COMMENT 'id',
  `transaction_date` varchar(8) DEFAULT NULL COMMENT '交易日期YYYYMMDD',
  `transaction_time` varchar(6) DEFAULT NULL COMMENT '交易时间HH24MISS',
  `serial_no` varchar(24) DEFAULT NULL COMMENT '交易流水号',
  `fund_no` varchar(24) DEFAULT NULL COMMENT '资金账号',
  `client_name` varchar(128) DEFAULT NULL COMMENT '户名',
  `account_no` varchar(64) DEFAULT NULL COMMENT '银行账号(卡号)',
  `open_account_name` varchar(128) DEFAULT NULL COMMENT '开户名称',
  `amount` bigint(16) DEFAULT NULL COMMENT '发生额(资金单位:分',
  `trsflag` varchar(4) DEFAULT NULL COMMENT 'A00 正常出金 \\r\\nB01 解冻资金后，再出金\\r\\n',
  `balflag` varchar(4) DEFAULT NULL COMMENT '结算方式标示 \\r\\nT0=T0结算出金\\r\\nT1=T1结算出金',
  `usage` varchar(128) DEFAULT NULL COMMENT '资金用途(附言)',
  `state` varchar(6) DEFAULT NULL COMMENT '提现状态',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `nonedel` char(1) DEFAULT '0' COMMENT '0:未删除 1:已删除',
  `remark` varchar(15) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='提现明细表';

-- ----------------------------
-- Table structure for scf_bank_account_ld
-- ----------------------------
DROP TABLE IF EXISTS `scf_bank_account_ld`;
CREATE TABLE `scf_bank_account_ld` (
  `id` varchar(18) NOT NULL,
  `fk_account_id` varchar(64) DEFAULT NULL COMMENT '关联专属账户表ID',
  `account_name` varchar(64) DEFAULT NULL COMMENT '账户名称',
  `account_no` int(64) DEFAULT NULL COMMENT '账号',
  `opening_bank` varchar(64) DEFAULT NULL COMMENT '开户银行',
  `opening_bank_code` varchar(64) DEFAULT NULL COMMENT '开户银行编码',
  `opening_province` varchar(64) DEFAULT NULL COMMENT '开户行省份',
  `opening_city` varchar(64) DEFAULT NULL COMMENT '开户行城市',
  `opening_branch` varchar(64) DEFAULT NULL COMMENT '营业网点支行',
  `state` varchar(64) DEFAULT NULL COMMENT '状态 01 有效， 02 失效',
  `account_type` varchar(64) DEFAULT NULL COMMENT '账号类型(对公账户、放款账户、还款账户、提现账户)',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `nonedel` char(1) DEFAULT '0' COMMENT '0:未删除 1:已删除',
  `remark` varchar(15) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企业账号表（对公账户、放款账户、还款账户、提现账户）';

-- ----------------------------
-- Table structure for scf_exclusive_account_ld
-- ----------------------------
DROP TABLE IF EXISTS `scf_exclusive_account_ld`;
CREATE TABLE `scf_exclusive_account_ld` (
  `id` varchar(18) NOT NULL,
  `account_name` varchar(64) DEFAULT NULL COMMENT '账户名称',
  `bank_account_id` int(64) DEFAULT NULL COMMENT '银行电子账号',
  `account_balance` varchar(64) DEFAULT NULL COMMENT '账户余额',
  `open_bank` varchar(64) DEFAULT NULL COMMENT '开户行',
  `open_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '开户时间',
  `account_state` varchar(64) DEFAULT NULL COMMENT '账户状态',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `nonedel` char(1) DEFAULT '0' COMMENT '0:未删除 1:已删除',
  `remark` varchar(15) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='专属账户表';

-- ----------------------------
-- Table structure for scf_supplier_behavior_record_ld
-- ----------------------------
DROP TABLE IF EXISTS `scf_supplier_behavior_record_ld`;
CREATE TABLE `scf_supplier_behavior_record_ld` (
  `id` varchar(18) NOT NULL,
  `fk_supplier_user_id` varchar(18) DEFAULT NULL COMMENT '关联供应商企业主键id',
  `behavior_record` varchar(128) DEFAULT NULL COMMENT '行为记录',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `nonedel` char(1) DEFAULT '0' COMMENT '0:未删除 1:已删除',
  `remark` varchar(15) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企业行为记录表';

-- ----------------------------
-- Table structure for scf_supplier_detail_ld
-- ----------------------------
DROP TABLE IF EXISTS `scf_supplier_detail_ld`;
CREATE TABLE `scf_supplier_detail_ld` (
  `id` varchar(18) NOT NULL,
  `company_name` varchar(50) DEFAULT NULL COMMENT '企业名称',
  `business_license_number` varchar(50) DEFAULT NULL COMMENT '营业执照号',
  `the_applicant` varchar(15) DEFAULT NULL COMMENT '申请人',
  `mobile_phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `e_mail` varchar(30) DEFAULT NULL COMMENT '电子邮箱',
  `industry_type` varchar(30) DEFAULT NULL COMMENT '所属行业',
  `enterprise_nature` varchar(30) DEFAULT NULL COMMENT '企业性质',
  `registered_capital` decimal(20,0) DEFAULT NULL COMMENT '注册资本',
  `setup_year` varchar(15) DEFAULT NULL COMMENT '成立年限01:1年内;02:1-5年;03:5-10年;04:10-15年;05:15年以上',
  `legal_person_name` varchar(15) DEFAULT NULL COMMENT '法人姓名',
  `legal_person_mobile_phone` varchar(20) DEFAULT NULL COMMENT '法人电话号码',
  `company_address` varchar(50) DEFAULT NULL COMMENT '公司地址',
  `business_license` varchar(50) DEFAULT NULL COMMENT '文件关联ID 工商营业执照',
  `organization_code_certificate` varchar(50) DEFAULT NULL COMMENT '文件关联ID 组织机构代码证',
  `under_the_code` varchar(30) DEFAULT NULL COMMENT '中征证码',
  `legal_person_identity_front` varchar(50) DEFAULT NULL COMMENT '文件关联ID 法人身份证正面',
  `legal_person_identity_behind` varchar(50) DEFAULT NULL COMMENT '文件关联ID 法人身份证反面',
  `hand_held_identification_card` varchar(50) DEFAULT NULL COMMENT '文件关联ID 操作者手持身份证',
  `hand_held_identification_card_behind` varchar(50) DEFAULT NULL COMMENT '操作人持身份证反面照',
  `account_name` varchar(15) DEFAULT NULL COMMENT '账户名',
  `legal_representative` varchar(10) DEFAULT NULL COMMENT '法定代表人姓名',
  `legal_representative_phone` varchar(16) DEFAULT NULL COMMENT '法定代表人手机号',
  `legal_representative_id` varchar(18) DEFAULT NULL COMMENT '法定代表人身份证号',
  `account_number` varchar(40) DEFAULT NULL COMMENT '对公账号（考虑删除）',
  `open_bank` varchar(25) DEFAULT NULL COMMENT '开户银行（考虑删除）',
  `outlets` varchar(40) DEFAULT NULL COMMENT '营业网点（考虑删除）',
  `outlets_province` varchar(40) DEFAULT NULL COMMENT '营业网点省（考虑删除）',
  `outlets_city` varchar(40) DEFAULT NULL COMMENT '营业网点城（考虑删除）',
  `outlets_detail` varchar(200) DEFAULT NULL COMMENT '营业网点具体营业部（考虑删除）',
  `electronic_signature` varchar(5) DEFAULT NULL COMMENT '电子签名',
  `state` varchar(5) DEFAULT NULL COMMENT '状态 01:第一步 02:第二步 03:第三步 04:第四步 05:第五步 待核心企业审核 06 核心企业审核不通过 07 核心企业通过，待平台审核 08平台运营审核不通过 09 平台运营审核通过  10已签署平台服务协议 ',
  `application_fee` decimal(10,0) DEFAULT NULL COMMENT '申请费用',
  `fk_supplier_user_id` varchar(50) DEFAULT NULL COMMENT '关联供应商企业主键id',
  `contact_name` varchar(20) DEFAULT NULL COMMENT '被授权操作人姓名',
  `contact_phone` varchar(20) DEFAULT NULL COMMENT '被授权操作人手机号',
  `contact_id` varchar(20) DEFAULT NULL COMMENT '被授权操作人身份证号',
  `fail_reason` varchar(200) DEFAULT NULL COMMENT '未通过原因（可用作多个地方）',
  `certificate_file_zip` varchar(50) DEFAULT NULL COMMENT '申请证书上传相关压缩包文件',
  `apply_time` timestamp NULL DEFAULT NULL COMMENT '申请日期',
  `platform_service_agreement` varchar(50) DEFAULT NULL COMMENT '平台服务协议签署对应文件',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `nonedel` char(1) DEFAULT '0' COMMENT '0:未删除 1:已删除',
  `remark` varchar(15) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商用户详情表';

-- ----------------------------
-- Table structure for scf_supplier_user_ld
-- ----------------------------
DROP TABLE IF EXISTS `scf_supplier_user_ld`;
CREATE TABLE `scf_supplier_user_ld` (
  `id` varchar(18) NOT NULL,
  `mobile_phone` varchar(20) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `company_name` varchar(40) DEFAULT NULL COMMENT '企业名称',
  `business_license_number` varchar(50) DEFAULT NULL COMMENT '营业执照号',
  `register_type` varchar(15) DEFAULT NULL COMMENT '注册类型 01通过注册 02 通过核心企业白名单上传',
  `password_flag` varchar(5) DEFAULT NULL,
  `lockpass_date` timestamp NULL DEFAULT NULL,
  `the_time_login` timestamp NULL DEFAULT NULL,
  `invite_code` varchar(25) DEFAULT NULL,
  `login_flag` varchar(5) DEFAULT '01' COMMENT '判断用户是否是首次登陆 01首次 02不是',
  `cert_status` varchar(5) DEFAULT '01' COMMENT '证书状态 01未生成02已生成 ',
  `subject_dn` varchar(256) DEFAULT '' COMMENT '用户证书主题',
  `serial_number` varchar(50) DEFAULT '' COMMENT '证书序列号',
  `fk_core_enterprise_id` varchar(50) DEFAULT NULL COMMENT '所属核心企业ID（核心企业分类表ID）',
  `fk_core_enterprise_name` varchar(30) DEFAULT NULL COMMENT '所属核心企业名称',
  `latest_upload_time` timestamp NULL DEFAULT NULL COMMENT '最新上传时间',
  `user_check_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '用户登录校验时间',
  `fk_white_supplier_id` varchar(50) DEFAULT NULL COMMENT '关联供应商白名单id',
  `fk_cert_id` varchar(50) DEFAULT NULL COMMENT '证书ID',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `nonedel` char(1) DEFAULT '0' COMMENT '0:未删除 1:已删除',
  `remark` varchar(15) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商账户表';

-- ----------------------------
-- Table structure for scf_supplier_white_ld
-- ----------------------------
DROP TABLE IF EXISTS `scf_supplier_white_ld`;
CREATE TABLE `scf_supplier_white_ld` (
  `id` varchar(18) NOT NULL COMMENT '主键',
  `enterprise_name` varchar(40) DEFAULT NULL COMMENT '供应商名称',
  `business_license_number` varchar(50) DEFAULT NULL COMMENT '营业执照号',
  `mobile_phone` varchar(15) DEFAULT NULL COMMENT '联系人手机号',
  `e_mail` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `line_credit` varchar(20) DEFAULT NULL COMMENT '授信额度',
  `fk_core_enterprise_name` varchar(30) DEFAULT NULL COMMENT '所属核心企业名称',
  `fk_core_enterprise_id` varchar(50) DEFAULT NULL COMMENT '所属核心企业ID（核心企业分类表ID）',
  `initial_password` varchar(256) DEFAULT NULL COMMENT '初始密码',
  `invite_code` varchar(15) DEFAULT NULL COMMENT '邀请码',
  `wy_send_line` varchar(5) DEFAULT NULL COMMENT '邀请方式：01：短信，02：邮件，03：短信加邮件，04：未发送',
  `message_source` varchar(10) DEFAULT NULL COMMENT '信息来源：01：核心企业上传白名单，02：供应商上传申请未认证；03：供应商上传申请已认证；04：供应商上传申请否决；',
  `financing_type` varchar(10) DEFAULT NULL COMMENT '供应商类型：01供应商，02：经销商',
  `whether_financing` varchar(10) DEFAULT NULL COMMENT '能否融资：01：允许融资，02：禁止融资 03:未配置',
  `fk_supplier_id` varchar(50) DEFAULT NULL COMMENT '关联供应商ID(融资企业)',
  `latest_upload_time` timestamp NULL DEFAULT NULL COMMENT '应收账款最新上传时间',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `nonedel` char(1) DEFAULT '0' COMMENT '0:未删除 1:已删除',
  `remark` varchar(15) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='白名单';
