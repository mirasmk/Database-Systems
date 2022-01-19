from sqlalchemy import create_engine, text

def query_1 ():
    print('Query 1:')
    first = db.execute("SELECT ds.disease_code, ds.description "
                       "FROM disease ds "
                       "LEFT JOIN discover dc ON ds.disease_code=dc.disease_code "
                       "WHERE ds.pathogen='bacterium' AND EXTRACT(YEAR FROM dc.first_enc_date)<1990 ")
    for r in first:
        print(r)
    print('\n')

def query_2():
    print('Query 2:')
    second = db.execute("SELECT us.name, us.surname, doc.degree "
                        "FROM (SELECT MIN(spec.id) AS id, MIN(spec.email) AS email "
                        "FROM specialize spec "
                        "GROUP BY spec.email ) t1 "
                        "LEFT JOIN users us ON t1.email=us.email "
                        "LEFT JOIN doctor doc ON t1.email=doc.email "
                        "WHERE t1.id!=1")
    for r in second:
        print(r)
    print('\n')

def query_3():
    print('Query 3:')
    third = db.execute("SELECT us.name, us.surname, doc.degree "
                       "FROM (SELECT count(spec.id) as cn, MIN(spec.email) AS email "
                       "FROM specialize spec "
                       "GROUP BY spec.email ) t1 "
                       "LEFT JOIN users us ON t1.email=us.email "
                       "LEFT JOIN doctor doc ON t1.email=doc.email "
                       "WHERE t1.cn>1")
    for r in third:
        print(r)
    print('\n')

def query_4():
    print('Query 4:')
    fourth = db.execute("SELECT MIN(cn.cname) AS countries, "
                        "CASE WHEN AVG(us.salary)!=0 THEN AVG(us.salary) ELSE '0' END AS avg_salary "
                        "FROM (SELECT spec.email "
                        "FROM specialize spec "
                        "WHERE spec.id=5) t1 "
                        "LEFT JOIN users us ON t1.email=us.email "
                        "LEFT JOIN doctor doc ON t1.email=doc.email "
                        "RIGHT JOIN country cn ON us.cname=cn.cname "
                        "GROUP BY cn.cname")
    for r in fourth:
        print(r)
    print('\n')

def query_5():
    print('Query 5:')
    fifth = db.execute("SELECT distinct ps.department, "
                       "CASE WHEN t2.department>'a' THEN '1' ELSE '0' END AS number_of_public_servants "
                       "FROM publicservant ps "
                       "LEFT JOIN (SELECT t2.* "
                                  "FROM (SELECT MIN(rc.email) AS email, MIN(ps.department) AS department "
                                  "FROM record rc "
                                  "LEFT JOIN publicservant ps ON rc.email=ps.email "
                                  "WHERE rc.disease_code='covid-19' "
                                  "GROUP BY rc.email "
                                  "HAVING COUNT(rc.disease_code)>1 ) t2) t2 ON ps.department=t2.department "
                       "ORDER BY ps.department")
    for r in fifth:
        print(r)
    print('\n') 

def query_6():
    sixth = db.execute("UPDATE users "
                       "SET salary = salary * 2 "
                       "WHERE email IN (SELECT MIN(rc.email) AS email "
				                            "FROM record rc "
				                            "LEFT JOIN publicservant ps ON rc.email=ps.email "
				                            "WHERE rc.disease_code='covid-19' "
				                            "GROUP BY rc.email "
				                            "HAVING COUNT(rc.disease_code)>3)")
    print('Query 6 has successfully run\n')

def query_7():
    seventh = db.execute("DELETE FROM users WHERE surname LIKE '%bek'")
    print('Query 7 has successfully run\n')

def query_8():
    eighth = db.execute("CREATE INDEX idx_pathogen ON disease (pathogen)")
    print('Query 8 has successfully run\n')

def query_9():
    print('Query 9:')
    ninth = db.execute("SELECT DISTINCT rc.email, us.name, ps.department "
                       "FROM record rc "
                       "LEFT JOIN users us ON rc.email=us.email "
                       "LEFT JOIN publicservant ps ON rc.email=ps.email "
                       "WHERE rc.total_patients>100000 AND 999999>rc.total_patients")
    for r in ninth:
        print(r)
    print('\n')

def query_10():
    print('Query 10:')
    tenth = db.execute("SELECT MIN(rc.cname) AS cname, SUM(rc.total_patients) AS sum_of_total_patients "
                       "FROM record rc "
                       "LEFT JOIN country cn ON rc.cname=cn.cname "
                       "GROUP BY rc.cname "
                       "ORDER BY sum_of_total_patients DESC "
                       "LIMIT 5")
    for r in tenth:
        print(r)
    print('\n')

def query_11():
    print('Query 11:')
    eleventh = db.execute("SELECT MIN(dt.description) AS description, "
                          "CASE WHEN SUM(rc.total_patients)!=0 THEN SUM(rc.total_patients) ELSE '0' END AS sum_of_total_patients "
                          "FROM record rc "
                          "LEFT JOIN country cn ON rc.cname=cn.cname "
                          "LEFT JOIN disease ds ON rc.disease_code=ds.disease_code "
                          "RIGHT JOIN diseasetype dt ON ds.id=dt.id "
                          "GROUP BY dt.description")
    for r in eleventh:
        print(r)
    print('\n') 

db = create_engine("postgresql://postgres:250598@localhost:5432/CSCI341")
db.connect()

query_1()   
query_2()
query_3()
query_4()
query_5()
query_6()
query_7()  
query_8()
query_9()
query_10()
query_11()

