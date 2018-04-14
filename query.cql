// queries
//can probably simplify this but it gives the total number of students taking the specified module in semseter 2
MATCH(c:Cohort{start_academic_year:2017})-[e:enrolled_on]-(cc:Course)-[m:contains_module{semester:2}]->(n:Module{module_id:'CMM534'}) RETURN SUM(c.size)

// note this doesnt give the staff position because that wasn't asked for
//included the cohort query and where statement as a safeguard against zero cohorts
MATCH (co:Cohort{start_semester:2,start_academic_year:2017})-[:enrolled_on]-(c:Course{course_name:'Data Science'})-[m:contains_module{semester:2}]->(mm:Module)<-[t:teaches{academic_year:2017}]-(S:Staff)  
WHERE co.size>0
return S.name AS staff_member,collect(mm.module_id) AS taught_modules 