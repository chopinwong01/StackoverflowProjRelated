text='''stackOverflow.reputation & directly available as attributes, changing with user owned posts(e.g. questions/answers) being voted &   
user on site time & duration since user account been created, subtraction of current time and CreationDate &   
User Activity & extract from user_AccessHistory, which are set of lastAccessDate with UserAccountID &   
Views & directly available as attributes, which count the time of user profile been viewed &   
Up Votes Cast & directly available as attributes, count of the upVotes of user cast &   
Down Votes Cast & directly available as attributes, count of the downVotes of user cast &   
Location.userCount & number of users in a location & 
badgesCount & number of badges a user awarded &   
Posts.score & the number of a post been scored &   
Posts.viewCount & the number of a post been viewed &   
Posts.commentsCount & the number of comments a post got &   
Posts.favoriteCount & the number of a post been favored &   
duration of post creation &  duration since post been created, calculated by comparing current date with CreationDate &   
active duration of post & duration of post in active, can be calculated by comparing CreationDate and LastActivityDate or closedDate if available &   
ClosedDate & close date of a post &   
CommuinityOwnedDate & community owned date of a post &   
count of post of user closed & number of posts closed posted by a user &   
count of post of user communityOwned & number of posts communityOwned posted by a user &   
AnswerCount & number of answers a user posted &   
isAccepted & boolean values, indicate if the answer had been accepted, 1 if Id match acceptedAnswerId in table Questions &   
accepted answer count & number of answers a user been accepted, by count the number of posts where Answers.isAccepted=1 &   
post activity & extract from Post\_ActivityHistory, which are set of LastActivityDate with PostId &   
user edits count & number of user edits, counting by UserId in Post\_history &   
 average gap of revision & calculated by averaging differences of CreationDate of postHistory which share the same PostId &   
Postive votes & number of votes a post been cast where voteTypeId=1,2,5 &   
Negative votes & number of votes a post been cast where voteTypeId=3,4,6,10,12,15 &   
 score of comments & the number of a comment been scored &   
duration of comments creation & duration since comment been created, calculated by comparing current date with CreationDate &   
number of posts of a user & count of post a user(owner) created &   
how active is a user cast votes & AVERAGE votes(positive/negative/total) casts per user per day (OVER user on site time) & x105/x102, x106/x102, (x105+x106/x102) 
how frequent is a post been commented & RATIO of comments of post(questions/answers) TO its duration since created & x112/x114 
how is likely a post been commented & RATIO of comments of post(questions/answers) TO its view count & x112/x111 
how fast is post been favorited & RATIO of favorite counts of post (question/ answers) TO its duration since created & x113/x114 
how is likely a post been favorited & RATIO of favorite counts of post (question/ answers) TO its view count & x113/x111 
how is likely a post by a user been favorited & RATIO of favorite counts of post (question/ answers) by a user TO total number of post with same postType(answer/question) & x113/($\sum\limits_{i=0}^k x130_{m,n} $ k=number of posts, m=UserId, n=PostTypeId(1 for questions, 2 for ansewrs) 
how is likely a post by a user been commented & RATIO of favorite counts of post (question/ answers) by a user TO total number of post with same postType(answer/question) & x112/($\sum\limits_{i=0}^k x130_{m,n} $ k=number of posts, m=UserId, n=PostTypeId(1 for questions, 2 for ansewrs) 
how is a post been scored & RATIO of score of post TO its view count & x110/x111 
how fast is a user reputation increasing & RATIO of stackoverflow.reputation TO user on site time & x101/x102 
how often is a user been scored & RATIO of SUM of score a user got by comments TO user on site time & ($\sum\limits_{i=0}^k x128_{j} $)/x102 , k=number of posts, j=userId 
how active is a user & RATIO of user activities TO user on site time & x103/x102 
how often is a user been viewed & RATIO of views on users profile pages TO user on site time & x104/x102 
how frequent is a user casting votes & RATIO of votes(postive/negative) a user been cast TO his/her on site time & ($\sum\limits_{i=0}^k x126_{j} $)/x102, ($\sum\limits_{i=0}^k x127_{j} $)/x102  , k=number of posts, j=userId  
how often is answers of a user been accepted & RATIO of number of accepted answers a user posted OVER post creation time & x122/x114 
how frequent is a user answering questions & RATIO of number of answers a user posted OVER user on site time & x120/x102 
how active is a post & RATIO of post activity OVER post creation time & x123/x114 
how is a user been voted & ODD of users votes & x126/(x126+x127) '''

textlist=text.split('\n')
for i in range(len(textlist)):
    textlist[i]=textlist[i].split(' & ')
    textlist[i]=textlist[i][:-1]

value=[]
for i in range(101,130)+range(201,218):
  value.append(['0','0'])   #[Value, NormalizedValue]

results=[]
for i in range(101,130)+range(201,218):
  results.append([str(i)])


for i in range(len(results)):
    results[i].append(textlist[i][0])  #Name
    results[i].append(textlist[i][1])  #Description
    results[i].append(value[i][0])     #Value
    results[i].append(value[i][1])     #NormalizedValue

queries=""
for (Id,Name,Description,Value,NormalizedValue) in results:
  queries+='UPDATE Features'+'\nSET Name=\''+Name+'\',Value=\''+Value+'\',NormalizedValue=\''+NormalizedValue+'\',Description=\''+Description+'\'\nWHERE Id='+Id+';'+'\n\n'

print queries