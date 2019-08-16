#!/bin/bash
#
# Licensed to Julian Hyde under one or more contributor license
# agreements.  See the NOTICE file distributed with this work
# for additional information regarding copyright ownership.
# Julian Hyde licenses this file to you under the Apache
# License, Version 2.0 (the "License"); you may not use this
# file except in compliance with the License.  You may obtain a
# copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied.  See the License for the specific
# language governing permissions and limitations under the
# License.

cd $(dirname $0) # src/test/resources/script
repo=$(basename $0 .sh) # "scott"
case $(pwd) in
    (*/src/test/resources/script)
        root=$(pwd)/../../../..;
        mkdir -p ${root}/target/repo;
        cd ${root}/target/repo
        ;;
    (*) echo "Invalid directory $(pwd)"
        exit 1
        ;;
esac

git init $repo
cd $repo
mkdir -p data
cat >data/EMP.csv <<!EOF
EMPNO:int,ENAME:string,JOB:string,MGR:int,HIREDATE:date,SAL:decimal,COMM:decimal,DEPTNO:int
7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20
7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30
7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30
7566,'JONES','MANAGER',7839,'1981-02-04',2975,NULL,20
7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30
7698,'BLAKE','MANAGER',7839,'1981-01-05',2850,NULL,30
7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10
7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,NULL,20
7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10
7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30
7876,'ADAMS','CLERK',7788,'1987-05-23',1100,NULL,20
7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30
7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20
7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10
!EOF
git add data/EMP.csv
cat >data/DEPT.csv <<!EOF
DEPTNO:int,DNAME:string,LOC:string
10,'ACCOUNTING','NEW YORK'
20,'RESEARCH','DALLAS'
30,'SALES','CHICAGO'
40,'OPERATIONS','BOSTON'
!EOF
git add data/DEPT.csv
git commit -m"Initial EMP, DEPT" -a

# End scott.sh
