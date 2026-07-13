create database project ;
use project ;
select * from tickets ;

/*  1.	Display all tickets */

select Ticket_Subject from tickets ;

/* 3. Display all High priority tickets */

select * from tickets where priority_level = "High" ;

/* 4.	Find tickets raised through Email. */

select * from tickets where ticket_channel = "Email" ;

/* 5.	Show all tickets belonging to the Technical category.  */

select * from tickets where Issue_Category = "Technical" 

/*  6.	Display tickets created in the year 2024. */

select * from tickets where Submission_Date >= '2024-01-01' and Submission_Date <= '2024-12-31' ;

SELECT * FROM tickets  WHERE Submission_Date >= '2024-01-01' AND Submission_Date <= '2024-12-31';

/* 7.	Find customers whose satisfaction rating is 5. */

select Customer_Name , Satisfaction_Score from tickets where Satisfaction_Score = 5 ;

/*  8.	Show all distinct ticket categories. */

select distinct Issue_Category from tickets ;

/* 9.	Count total number of tickets. */

select count(Ticket_ID) from tickets ;

/* 10.	Count tickets by channel. */

select count(Ticket_ID), Ticket_Channel from tickets group by Ticket_Channel ;

/* 11.	Find total customers. */

select count(Customer_Name) from tickets ;

/*  12.	Show all tickets sorted by Created Date. */

select Ticket_ID , Submission_date from tickets order by Submission_date asc ;

/* 13.	Display tickets with resolution time greater than 3 days. */

select Ticket_ID , Resolution_Time_Hours  from tickets where Resolution_Time_Hours >= (24*3) ;

/* 14.	Find tickets assigned to a specific support agent 'David Kim' */

select * from tickets where Assigned_Agent = "David Kim" ;

/*  15.	Show tickets with Priority level high.  */

select Ticket_ID , Priority_Level from tickets where Priority_Level = "High" ;

/* 16.	Count tickets in each category. */

select count(Ticket_ID), Issue_Category from tickets group by Issue_Category ;

/*  17.	Count tickets based on priority. */

select count(Ticket_ID) , Priority_Level from tickets group by Priority_Level ;

/* 18.	Find average customer satisfaction rating. */

select avg(Satisfaction_Score) from tickets ;

/* 19.	Find maximum resolution time. */

select max(Resolution_Time_Hours) from tickets ;

/*  20.	Find minimum resolution time. */

select min(Resolution_Time_Hours) from tickets ;

/*  21.	Calculate average resolution time by category. */

select avg(Resolution_Time_hours) , Issue_Category from tickets group by Issue_Category ;

/*  22.	Calculate average satisfaction rating by support channel. */

select avg(Satisfaction_Score) , Ticket_Channel from tickets group by Ticket_Channel ;

/* 23.	Find total tickets handled by each support agent.  */

select count(Ticket_ID), Assigned_Agent from tickets group by Assigned_Agent ;

/* 24.	Find ticket count for each support channel. */

select count(Ticket_ID) , Ticket_Channel from tickets group by Ticket_Channel ;

/* 25.	Display categories having more than 100 tickets. */

select Issue_Category, count(Ticket_ID) from tickets group by Issue_Category having count(Ticket_ID)>100 ;

/* 26.	Find average resolution time for each priority. */

select avg(Resolution_Time_Hours), Priority_Level from tickets group by Priority_Level ;

/* 29.	Find customers who raised more than one ticket.   */

select Customer_name , count(Ticket_ID) from tickets group by Customer_Name having count(Ticket_ID) > 1 ;

/* 30.	Count tickets created every month. */

select count(Ticket_ID), monthname(Submission_Date) as month from tickets group by monthname(Submission_Date) ;

/*  31.	Rank support agents by number of resolved tickets. */

select Assigned_Agent, count(Ticket_ID), rank () over (Order by count(Ticket_ID) desc) as agent_rank from tickets group by Assigned_Agent ;

/* 32.	Find Top 5 agents with highest customer ratings. */

select Assigned_Agent, Satisfaction_Score from tickets order by Satisfaction_Score desc limit 5 ;

/*  33.	Find ticket category with highest average resolution time. */

select Issue_Category , Resolution_Time_Hours from tickets order by Resolution_Time_Hours desc limit 1 ;

/* 34.	Calculate percentage of tickets via chat channel. */

select (count(Ticket_Channel)/100) as channel from tickets where Ticket_Channel = "Chat" ;

/* 36.	Find customers having average rating below 3.  */

select Customer_Name, avg(Satisfaction_Score) from tickets group by Customer_Name having avg(Satisfaction_Score) <3 ;

/* 37.	Display latest ticket for every customer.  */

select Customer_Name, Submission_Date from tickets t1 where Submission_date = (select max(Submission_Date) from tickets t2 where t1.Customer_Name = t2.Customer_name) ;

/* 38.	Display first ticket created by every customer. */

select Customer_Name, Submission_Date from tickets t1 where Submission_date = (select min(Submission_Date) from tickets t2 where t1.Customer_Name = t2.Customer_name) ;

/* 39.	Find busiest month based on ticket count. */

select count(Ticket_ID), monthname(Submission_Date) from tickets group by monthname(Submission_Date) order by count(Ticket_ID) desc limit 1;

/* 40.	Find category contributing highest percentage of tickets. */

select count(Ticket_ID)/100 as percent, Issue_Category from tickets group by Issue_Category order by count(Ticket_ID)/100 desc limit 1 ;

/* 42.	Find average resolution time month-wise. */

select avg(Resolution_Time_Hours), monthname(Submission_Date) from tickets group by monthname(Submission_Date) ;

/* 45.	Find top-performing support channel based on customer satisfaction. */

select Ticket_Channel, avg(Satisfaction_Score) from tickets group by Ticket_Channel order by avg(Satisfaction_Score) desc limit 2 ;

/* 46.	Find categories where average rating is below overall average. */

select Issue_Category , avg(Satisfaction_Score) from tickets group by Issue_Category having avg(Satisfaction_Score) < (select avg(Satisfaction_Score) from tickets ) ;

/* 49.	Find trend of tickets by month and priority. */

select count(Ticket_ID) , monthname(Submission_Date) , Priority_Level from tickets group by  monthname(Submission_Date) , Priority_Level order by count(Ticket_ID) desc ;

