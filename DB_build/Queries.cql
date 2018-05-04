// queries
//gives the total number of students taking the specified module in semseter 2
//the where clause isn't strictly necessary in this case but it makes the query general. If the module was taught in semester 1, it would exclude the students who enrolled during semester 2
MATCH(c:Cohort{start_academic_year:2017})-[e:enrolled_on]-(cc:Course)-[m:contains_module{semester:2,academic_year:2017}]->(n:Module{module_id:'CMM534'}) 
WHERE c.start_semester <= m.semester
RETURN SUM(c.size)

// note this doesnt give the staff position because that wasn't asked for so staff members are included regardless of whether they lead or assisted with the course
//the where statement ensures a nonzero number of students were actually present in the specified cohort. In the edge case where there was no January intake, it ensures a null is returned.
MATCH (co:Cohort{start_semester:2,start_academic_year:2017})-[:enrolled_on]-(c:Course{course_name:'Data Science'})-[m:contains_module{semester:2}]->(mm:Module)<-[t:teaches{academic_year:2017}]-(S:Staff)  
WHERE co.size>0
return S.name AS staff_member,collect(mm.module_id) AS taught_modules 