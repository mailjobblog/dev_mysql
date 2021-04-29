-- 创建表
CREATE TABLE department ( dept_id INTEGER NOT NULL PRIMARY KEY, dept_name VARCHAR ( 50 ) NOT NULL );
CREATE TABLE job ( job_id INTEGER NOT NULL PRIMARY KEY, job_title VARCHAR ( 50 ) NOT NULL );
CREATE TABLE employee (
	emp_id INTEGER NOT NULL PRIMARY KEY,
	emp_name VARCHAR ( 50 ) NOT NULL,
	sex VARCHAR ( 10 ) NOT NULL,
	dept_id INTEGER NOT NULL,
	manager INTEGER,
	hire_date DATE NOT NULL,
	job_id INTEGER NOT NULL,
	salary NUMERIC ( 8, 2 ) NOT NULL,
	bonus NUMERIC ( 8, 2 ),
	email VARCHAR ( 100 ) NOT NULL,
	CONSTRAINT ck_emp_sex CHECK (
	sex IN ( '男', '女' )),
	CONSTRAINT ck_emp_salary CHECK ( salary > 0 ),
	CONSTRAINT uk_emp_email UNIQUE ( email ),
	CONSTRAINT fk_emp_dept FOREIGN KEY ( dept_id ) REFERENCES department ( dept_id ),
	CONSTRAINT fk_emp_job FOREIGN KEY ( job_id ) REFERENCES job ( job_id ),
	CONSTRAINT fk_emp_manager FOREIGN KEY ( manager ) REFERENCES employee ( emp_id ) 
);

-- 创建索引 
CREATE INDEX idx_emp_name ON employee ( emp_name );
CREATE INDEX idx_emp_dept ON employee ( dept_id );
CREATE INDEX idx_emp_job ON employee ( job_id );
CREATE INDEX idx_emp_manager ON employee ( manager );

-- 生成 MySQL 初始化数据
INSERT INTO department(dept_id, dept_name) VALUES (1, '行政管理部');
INSERT INTO department(dept_id, dept_name) VALUES (2, '人力资源部');
INSERT INTO department(dept_id, dept_name) VALUES (3, '财务部');
INSERT INTO department(dept_id, dept_name) VALUES (4, '研发部');
INSERT INTO department(dept_id, dept_name) VALUES (5, '销售部');
INSERT INTO department(dept_id, dept_name) VALUES (6, '保卫部');

INSERT INTO job(job_id, job_title) VALUES (1, '总经理');
INSERT INTO job(job_id, job_title) VALUES (2, '副总经理');
INSERT INTO job(job_id, job_title) VALUES (3, '人力资源总监');
INSERT INTO job(job_id, job_title) VALUES (4, '人力资源专员');
INSERT INTO job(job_id, job_title) VALUES (5, '财务经理');
INSERT INTO job(job_id, job_title) VALUES (6, '会计');
INSERT INTO job(job_id, job_title) VALUES (7, '开发经理');
INSERT INTO job(job_id, job_title) VALUES (8, '程序员');
INSERT INTO job(job_id, job_title) VALUES (9, '销售经理');
INSERT INTO job(job_id, job_title) VALUES (10, '销售人员');

INSERT INTO employee VALUES (1, '刘备', '男', 1, NULL, DATE('2000-01-01'), 1, 30000, 10000, 'liubei@mailjob.net');
INSERT INTO employee VALUES (2, '关羽', '男', 1, 1, DATE('2000-01-01'), 2, 26000, 10000, 'guanyu@mailjob.net');
INSERT INTO employee VALUES (3, '张飞', '男', 1, 1, DATE('2000-01-01'), 2, 24000, 10000, 'zhangfei@mailjob.net');
INSERT INTO employee VALUES (4, '诸葛亮', '男', 2, 1, DATE('2006-03-15'), 3, 24000, 8000, 'zhugeliang@mailjob.net');
INSERT INTO employee VALUES (5, '黄忠', '男', 2, 4, DATE('2008-10-25'), 4, 8000, NULL, 'huangzhong@mailjob.net');
INSERT INTO employee VALUES (6, '魏延', '男', 2, 4, DATE('2007-04-01'), 4, 7500, NULL, 'weiyan@mailjob.net');
INSERT INTO employee VALUES (7, '孙尚香', '女', 3, 1, DATE('2002-08-08'), 5, 12000, 5000, 'sunshangxiang@mailjob.net');
INSERT INTO employee VALUES (8, '孙丫鬟', '女', 3, 7, DATE('2002-08-08'), 6, 6000, NULL, 'sunyahuan@mailjob.net');
INSERT INTO employee VALUES (9, '赵云', '男', 4, 1, DATE('2005-12-19'), 7, 15000, 6000, 'zhaoyun@mailjob.net');
INSERT INTO employee VALUES (10, '廖化', '男', 4, 9, DATE('2009-02-17'), 8, 6500, NULL, 'liaohua@mailjob.net');
INSERT INTO employee VALUES (11, '关平', '男', 4, 9, DATE('2011-07-24'), 8, 6800, NULL, 'guanping@mailjob.net');
INSERT INTO employee VALUES (12, '赵氏', '女', 4, 9, DATE('2011-11-10'), 8, 6600, NULL, 'zhaoshi@mailjob.net');
INSERT INTO employee VALUES (13, '关兴', '男', 4, 9, DATE('2011-07-30'), 8, 7000, NULL, 'guanxing@mailjob.net');
INSERT INTO employee VALUES (14, '张苞', '男', 4, 9, DATE('2012-05-31'), 8, 6500, NULL, 'zhangbao@mailjob.net');
INSERT INTO employee VALUES (15, '赵统', '男', 4, 9, DATE('2012-05-03'), 8, 6000, NULL, 'zhaotong@mailjob.net');
INSERT INTO employee VALUES (16, '周仓', '男', 4, 9, DATE('2010-02-20'), 8, 8000, NULL, 'zhoucang@mailjob.net');
INSERT INTO employee VALUES (17, '马岱', '男', 4, 9, DATE('2014-09-16'), 8, 5800, NULL, 'madai@mailjob.net');
INSERT INTO employee VALUES (18, '法正', '男', 5, 2, DATE('2017-04-09'), 9, 10000, 5000, 'fazheng@mailjob.net');
INSERT INTO employee VALUES (19, '庞统', '男', 5, 18, DATE('2017-06-06'), 10, 4100, 2000, 'pangtong@mailjob.net');
INSERT INTO employee VALUES (20, '蒋琬', '男', 5, 18, DATE('2018-01-28'), 10, 4000, 1500, 'jiangwan@mailjob.net');
INSERT INTO employee VALUES (21, '黄权', '男', 5, 18, DATE('2018-03-14'), 10, 4200, NULL, 'huangquan@mailjob.net');
INSERT INTO employee VALUES (22, '糜竺', '男', 5, 18, DATE('2018-03-27'), 10, 4300, NULL, 'mizhu@mailjob.net');
INSERT INTO employee VALUES (23, '邓芝', '男', 5, 18, DATE('2018-11-11'), 10, 4000, NULL, 'dengzhi@mailjob.net');
INSERT INTO employee VALUES (24, '简雍', '男', 5, 18, DATE('2019-05-11'), 10, 4800, NULL, 'jianyong@mailjob.net');
INSERT INTO employee VALUES (25, '孙乾', '男', 5, 18, DATE('2018-10-09'), 10, 4700, NULL, 'sunqian@mailjob.net');
