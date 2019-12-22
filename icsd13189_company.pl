employee(1,liz,white,4,2000).
employee(2,ted,johnson,5,1998).
employee(3,carol,wang,6,1997).
employee(4,chris,columbus,9,1999).
employee(5,jose,alberto,9,1999).
employee(6,brian,black,2,2001).
employee(7,susan,smith,3,1997).
employee(8,john,stanley,4,2000).
employee(9,mark,wyatt,8,1999).
employee(10,carmen,john,8,1998).
employee(11,jim,white,11,2001).
employee(12,stan,green,1,1999).
employee(13,bart,simpson,3,2000).
employee(14,ivan,bratko,2,1997).
employee(15,robert,sebesta,12,2001).
employee(16,stephen,muchnick,10,1998).
employee(17,david,kick,3,1999).
employee(18,kai,hwang,3,1999).
employee(19,faye,briggs,7,2001).
employee(20,david,patterson,5,1997).
employee(21,ian,sommerville,2,2000).
employee(22,shari,pfleeger,4,2000).
employee(23,roger,pressman,6,1998).
employee(24,andrew,appel,10,1997).
employee(25,ravi,sethi,6,2000).
employee(26,john,stone,6,2001).
employee(27,morris,mano,3,2000).
employee(28,liz,gamma,9,1998).
employee(29,greg,andrews,7,2000).
employee(30,susan,pagan,4,1999).
employee(31,ian,thomas,2,2000).
employee(32,shari,smith,4,2000).
employee(33,roger,rogers,6,1998).
employee(34,andrew,smith,10,1997).
employee(35,jeff,ullman,6,2000).
employee(36,jeff,smith,8,2001).
unit(co1,company,div1).
unit(co1,company,div2).
unit(div1,division,dept1).
unit(div1,division,dept2).
unit(div2,division,dept3).
unit(div2,division,dept4).
unit(dept1,department,gr1).
unit(dept1,department,gr2).
unit(dept1,department,gr3).
unit(dept2,department,gr4).
unit(dept3,department,gr5).
unit(dept3,department,gr6).
unit(dept4,department,gr7).
unit(dept4,department,gr8).
unit(gr1,group,16).
unit(gr1,group,17).
unit(gr1,group,18).
unit(gr2,group,19).
unit(gr2,group,20).
unit(gr3,group,21).
unit(gr3,group,22).
unit(gr4,group,23).
unit(gr4,group,24).
unit(gr4,group,25).
unit(gr4,group,26).
unit(gr5,group,27).
unit(gr5,group,28).
unit(gr5,group,29).
unit(gr6,group,30).
unit(gr6,group,31).
unit(gr7,group,32).
unit(gr7,group,33).
unit(gr7,group,34).
unit(gr8,group,35).
unit(gr8,group,36).
leader(co1,1).
leader(div1,2).
leader(div2,3).
leader(dept1,4).
leader(dept2,5).
leader(dept3,6).
leader(dept4,7).
leader(gr1,8).
leader(gr2,9).
leader(gr3,10).
leader(gr4,11).
leader(gr5,12).
leader(gr6,13).
leader(gr7,14).
leader(gr8,15).


%Tsotras_Stefanos
%icsd13189

%Erwthsh_1

recent(M, Y1, M2, Y2) :- Y1 < Y2.
recent(M, Y1, M2, Y2) :- Y1 = Y2, M < M2.

senior(X,Y) :- employee(X, _, _, M, Y1),
			   employee(Y, _, _, M2, Y2),
			   recent(M,Y1,M2,Y2).

			   
%Erwthsh_2

same_sur(Y,X,N) :-  unit(X, group, Y1),
				  employee(Y1,N1,S1,_,_),
				  N = N1,
				  Y \= Y1,
				  format('~w ~n',[S1]).
					
double_name(X) :- unit(X, group, Y),
				  employee(Y,N,S,_,_),
				  same_sur(Y,X,N),
				  format('~w ~n',[S]).
				  

%Erwthsh_3

reports_to(X,Y)	:-  
					unit(Z,_,X),
				    leader(Z,Y).
				   
reports_to(X,Y)	:-  
					leader(Z,X),
					unit(U,_,Z),
				    leader(U,Y).				   

					.			  		  
%Erwthsh_4

president(X) :- X = 1 .


%Erwthsh_5

senior_to_boss(X) :- reports_to(X,Y),
					 senior(X,Y).

					 
%Erwthsh_6

subunit(X,Y,Z) :-   Z = 1 ,
					unit(X,_,Y).
					
subunit(X,Y,Z) :-   Z = 2 ,
					unit(X,_,U),
					unit(U,_,Y).					