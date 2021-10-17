/*para1*/

/*meeting of the congress*/
monday(D,M,Y).

/* First monday of december */
meetingOfCongress(D,M,Y):- (monday(D,M,Y), M ==12,D<=7).



