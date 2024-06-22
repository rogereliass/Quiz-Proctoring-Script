assign_proctors(AllTAs, Quizzes, TeachingSchedule, ProctoringSchedule):-
	free_schedule(AllTAs,TeachingSchedule,FreeSchedule),
	assign_quizzes(Quizzes,FreeSchedule,ProctoringSchedule).
	
%-------------------------------------------------------------------------------

free_schedule(_,[],[]).
free_schedule(AllTAs, [day(DayName,Slots)|T], [day(DayName,FreeTAs)|T2]):-
	getTAs(AllTAs,DayName,NamesTAs), %got all TAs available on DayName
	todayFreeSchedule(NamesTAs,Slots,FreeTAs),
	free_schedule(AllTAs,T,T2).
	
	
todayFreeSchedule(_,[],[]).
todayFreeSchedule(DayTAs,[Slot|LeftSlots],[FreeNow|Rest]):-
	availableTAs(DayTAs,Slot,TFreeNow),
	permutation(TFreeNow,FreeNow),
	todayFreeSchedule(DayTAs,LeftSlots,Rest).

availableTAs([],_,[]).
availableTAs([Name|T],Slot,L):- member(Name,Slot) , availableTAs(T,Slot,L).
availableTAs([Name|T],Slot,[Name|L]):- \+member(Name,Slot), availableTAs(T,Slot,L).


getTAs([],_,[]).
getTAs([ta(_,DayOff)|T],DayOff,L):- getTAs(T,DayOff,L).
getTAs([ta(Name,DayOff)|T],Day,[Name|L]):- DayOff \= Day , getTAs(T,Day,L).

dayOff(AllTAs,ta(Name,DayOff)):- 
	member(ta(Name,DayOff),AllTAs).
    

%-------------------------------------------------------------------------------

assign_quizzes([], _, []).
assign_quizzes([Q|Qs], FreeSchedule, [proctors(Q,AssignedTAs)|T]):-
	assign_quiz(Q,FreeSchedule,AssignedTAs),
	assign_quizzes(Qs,FreeSchedule,T).
	
%-------------------------------------------------------------------------------
assign_quiz(quiz(_, Day, Slot, NumTAs), FreeSchedule, AssignedTAs) :-
    member(day(Day, Slots), FreeSchedule),
    nth1(Slot, Slots, List),
    returnNeeded(List,NumTAs,AssignedTAs).

returnNeeded(L, N, NeededOnes) :-
    length(NeededOnes, N),
    fill(NeededOnes, L).

fill([], _).
fill([X|Xs], L) :-
    member(X, L),
    select(X, L, Remaining), 
    fill(Xs, Remaining).
