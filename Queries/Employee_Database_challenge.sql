select e.emp_no,
		e.first_name,
		e.last_name,
		tl.title,
		tl.from_date,
		tl.to_date
--into retirement_titles
from employees e
inner join titles tl
	on tl.emp_no  = e.emp_no
where e.birth_date between '1952-01-01' and '1956-01-01'
order by e.emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;


select count(*), title
into retiring_titles
from unique_titles
group by title
order by count desc;


select distinct on (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	tl.title
into mentorship_eligibilty
from employees e
inner join titles tl
on tl.emp_no = e.emp_no
inner join dept_emp de
on de.emp_no  = e.emp_no
where de.to_date = '9999-01-01'
	and e.birth_date between '1965-01-01' and '1966-01-01'
order by e.emp_no