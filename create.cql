CREATE (C01:Course {course_name:'Computing Science'})
CREATE (C02:Course {course_name:'Data Science'})

CREATE (CMM504:Module {module_title:'OOP',module_id:'CMM504'})
CREATE (CMM507:Module {module_title:'Professional Development',module_id:'CMM507'})
CREATE (CMM510:Module {module_title:'Data Mining',module_id:'CMM510'})
CREATE (CMM524:Module {module_title:'Data Management',module_id:'CMM524'})
CREATE (CMM530:Module {module_title:'Systems Administration',module_id:'CMM530'})
CREATE (CMM531:Module {module_title:'Data Warehousing',module_id:'CMM531'})
CREATE (CMM534:Module {module_title:'Big Data',module_id:'CMM534'})
CREATE (CMM535:Module {module_title:'Data Visualisation',module_id:'CMM535'})
CREATE (CMM539:Module {module_title:'Information Retrieval',module_id:'CMM539'})

// link modules to courses
CREATE
	(C01)-[:contains_module{semester:1,academic_year:2017}]->(CMM524),
	(C01)-[:contains_module{semester:1,academic_year:2017}]->(CMM530),
	(C01)-[:contains_module{semester:1,academic_year:2017}]->(CMM539),
	(C01)-[:contains_module{semester:2,academic_year:2017}]->(CMM507),
	(C01)-[:contains_module{semester:2,academic_year:2017}]->(CMM510),
	(C01)-[:contains_module{semester:2,academic_year:2017}]->(CMM534),
	(C02)-[:contains_module{semester:1,academic_year:2017}]->(CMM510),
	(C02)-[:contains_module{semester:1,academic_year:2017}]->(CMM524),
	(C02)-[:contains_module{semester:1,academic_year:2017}]->(CMM531),
	(C02)-[:contains_module{semester:2,academic_year:2017}]->(CMM507),
	(C02)-[:contains_module{semester:2,academic_year:2017}]->(CMM534),
	(C02)-[:contains_module{semester:2,academic_year:2017}]->(CMM535)

// create student cohorts
CREATE (CT01: Cohort{start_semester:1 , start_academic_year:2017 , size:15})
CREATE (CT02: Cohort{start_semester:1 , start_academic_year:2017 , size:25})
CREATE (CT03: Cohort{start_semester:2 , start_academic_year:2017 , size:23})
CREATE (CT04: Cohort{start_semester:2 , start_academic_year:2017 , size:10})

// link student cohorts to courses
CREATE
	(CT01)-[:enrolled_on{}]->(C01),
	(CT02)-[:enrolled_on{}]->(C02),
	(CT03)-[:enrolled_on{}]->(C01),
	(CT04)-[:enrolled_on{}]->(C02)


// create staff
CREATE (S01:Staff {name:'David Lonie'})
CREATE (S02:Staff {name:'Ines Arana'})
CREATE (S03:Staff {name:'Rob Lothian'})
CREATE (S04:Staff {name:'Eyad Elyan'})

//link staff to modules
CREATE
	(S01)-[:teaches{position:'course_leader',academic_year:2017}]->(CMM504),
	(S01)-[:teaches{position:'course_leader',academic_year:2017}]->(CMM507),
	(S02)-[:teaches{position:'course_leader',academic_year:2017}]->(CMM510),
	(S03)-[:teaches{position:'course_leader',academic_year:2017}]->(CMM524),
	(S02)-[:teaches{position:'course_leader',academic_year:2017}]->(CMM530),
	(S04)-[:teaches{position:'course_leader',academic_year:2017}]->(CMM531),
	(S03)-[:teaches{position:'course_leader',academic_year:2017}]->(CMM534),
	(S03)-[:teaches{position:'course_leader',academic_year:2017}]->(CMM535),
	(S04)-[:teaches{position:'course_leader',academic_year:2017}]->(CMM539),
	(S01)-[:teaches{position:'course_assistant',academic_year:2017}]->(CMM510),
	(S03)-[:teaches{position:'course_assistant',academic_year:2017}]->(CMM531),
	(S04)-[:teaches{position:'course_assistant',academic_year:2017}]->(CMM534)


