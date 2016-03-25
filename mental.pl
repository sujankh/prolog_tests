% Author: Abhishek Anand
% Date: 03/25/2016
%
%



therapy:-write('What is your problem?'),nl,start.

reply(Key,Y):-
	(   Key == problem ->
	write('What is your problem?'),nl;
	(   Key == work ->
	write('What else do you regard as too much work?'),nl;
	(   (Key == father; Key == mother; Key ==brother; Key == sister; Key == wife; Key == family) ->
	write('Tell me more about your family.'),nl;
	(   Key == boss ->
	write('Tell me about your workplace.'),nl;
	(   Key == girlfriend ->
	write('Tell me about your relationship.'),nl;
	(   (Key == happy; Key == sad; Key == angry; Key=depressed; Key == empty) ->
	write('Tell me more.'),nl;
	(   Key == what ->
	write('What do you think?'),nl;
	(   Key == why ->
	write('Why should you what?'),nl;
	(   Key == who ->
	write('Who do you think?'),nl;
	(   Key == whom ->
	write('Whoever you can think of.'),nl;
	(   Key == how ->
	write('Tell me your suggestions.'),nl;
	(   Key == which ->
	write('Up to you.'),nl;
	(   (Key == yes; Key == maybe) ->
	write('Ok, continue'),nl;
	(   Key == no ->
	write('Can you explain?'),nl;
	(   Key == life ->
	write('How would you describe it?'),nl;
	false
	))))))))))))))),
	start.

reply_to(X):-
	Keyword = [father,mother,brother,sister,family,friend,boss,wife,girlfriend,happy,sad,angry,depressed,empty,problem,what,why,who,whom,how,which,yes,no,maybe,work,life],
	[Key|Y] = X,
	downcase_atom(Key, Newkey),
	(   member(Newkey, Keyword) ->
	reply(Newkey, Y); reply_to(Y)
	).

listsplit([H|T], H, T).

start:-
	readln(X),
	listsplit(X, H, T),
	(   H == 'goodbye';H=='Goodbye' ->
	write('Computer:Goodbye'),nl;
	(   reply_to(X) ->
	true;
	write('Computer:I see. Please continue'),nl,start
	)
	).


