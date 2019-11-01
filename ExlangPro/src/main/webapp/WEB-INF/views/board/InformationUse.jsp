<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- BootStrap Templet -->
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"	rel="stylesheet" />
<link href="/resources/bootstrapCSS/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="/resources/bootstrapCSS/fonts.css" rel="stylesheet" type="text/css" media="all" />

<!-- Bootstrap CSS, jQuery first, then Popper.js, then Bootstrap JS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	
</script>
<body class="indexBody">
	<div id="header-wrapper" class="container">
		<div id="header" class="container">
			<div id="logo">
				<h1>
					<a href="../">Exlang</a>
				</h1>
			</div>
			<div id="menu">
				<ul>
					<li><a href="/notice/list">공지사항</a></li>
					<li><a href="/board/list">프로필 게시판</a></li>
					<li><a href="/board/InformationUse">이용안내</a></li>
					<c:choose>
						<c:when test="${sessionScope.login_id eq null}">
							<li><a href="/login">로그인</a></li>
							<li><a href="/signup">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/member/update?mId=${sessionScope.login_id}">MyPage</a></li>
							<li><a href="/logout">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
	<div class="container" id="page">
		<div class="title">
			<h2>이용안내</h2>
		</div>
		<div>
			<p>How to Do A Language Exchange You should practice using the
				Cormier method, a language exchange method that has been proven for
				over 3 years at the C.E.L.M. school in Montreal, Canada. Overview
				Following the Cormier method, you will practice with native speakers
				of the language you're learning, in small mixed groups of speakers
				of the two languages - ideally, between 2 and 4 people. Half the
				time, you will be speaking in the language you're practicing, and
				half the time in your own language - to give your exchange partners
				a chance to practice too. During your practice, you should use the
				lesson plans in the Chat Companion. This will provide the structure
				and activities needed in your language exchange. It is the next best
				thing to having an actual qualified teacher facilitate your practice
				session. But unlike in the typical teacher-led conversation class,
				you will totally forget the idea of grammar and instead practice
				using what you know - what you've studied before. The activities you
				will do and the way you will do them will help your listening
				comprehension, pronunciation and vocabulary. Your grammar will
				improve on its own with practice. In addition, depending on the
				lesson plan you use, you will work on other communication and
				conversation skills. This is the best practice that's ever been
				designed for people who have an intermediate level in their second
				language! Since MyLanguageExchange.com does not provide a teacher to
				facilitate your online language exchange, you will have to do some
				preparation work on your own before the actual practice, as well as
				try to follow some guidelines during the practice. Before You
				Practice Before you practice, you should do the following to
				prepare. 1. Judge your level. 2. Form your practice group - choose
				your lesson plan. 3. Choose a guide for the practice session. 1.
				Judge Your Level To practice live conversation, such as face-to-face
				meet up or using voice chat, you need to be at least at an
				intermediate level. You are at an intermediate level if you: have
				mastered the basics of the language, which include basic vocabulary,
				grammar and pronunciation can carry on a simple conversation - even
				if your sentences are not always grammatically correct, and even if
				you sometimes don't catch a word or a phrase can get the gist of
				what is being said in everyday conversations with or by native
				speakers understand 40 to 70 % of what native speakers of the
				language say when they speak slowly. If you're a beginner, you
				should start with penpals and text chat - you can still use our Chat
				Companion with text chat, but you can go slowly and there's no
				pressure to reply right away. Penpals are for everyone because you
				can take your time writing email. If you're not sure about your
				level, you can sit in on a voice chat session and just listen or try
				talking a little if you feel like it. If your level is above
				intermediate, you're perfect for live conversation either in a
				face-to-face meet up or via voice chat! 2. Forming Your Group -
				Choosing the Lesson Plan You should practice in small groups. This
				makes it easier to speak out and you get more opportunities to
				speak: 2 to 4 people is ideal. We provide lesson plans for larger
				groups, but encourage you to break up into smaller groups. Your
				group size will help determine which lesson plan to use. When
				organizing your practice session, strive for equal numbers of
				speakers of each language. Also, you can learn more if members
				practicing the same language are at about the same level. 3. Choose
				a Guide We recommend that you select a guide from within your group
				and rotate guides at each practice session (take turns being the
				guide). The guide's role is to ensure that everyone gets a good
				practice session. He or she will: Operate the timer: tell everyone
				else to disable their timer by setting it to zero. When the timer
				expires, tell everyone to switch languages and change their lesson
				plans to the other language. Read out the questions or instructions
				and make sure everyone understands what to do. Make sure people
				stick to the language being practiced. During Your Practice During
				your practice session, you should try to follow these guidelines for
				an effective practice. 1. Use the timer. 2. Take charge of your own
				learning when speaking in your second language. 3. Be sensitive to
				your partners' needs when speaking in your own language. 4. Don't
				correct grammar all the time - strive for communication. 5. Be
				considerate to others. 1. Use the Timer - Respect everyone's
				practice time Use the timer to make sure everyone gets equal
				practice time. The timer tells you when to switch languages.
				Remember: everyone speaks in one language then everyone switches to
				the other language. This is to ensure a fair exchange - not to make
				things harder for you. If you don't know how to say something in
				your second language, feel free to say it in your first language!
				The only exceptions are the warm-up and summary, where the timer is
				used to limit the total time. More details will be given in the
				lesson plans. 2. Take Charge Of Your Own Learning (when speaking in
				your second language) Ask for explanations immediately when
				something is not clear - it's your responsibility to say so. Feel
				free to ask your partners to repeat, explain or translate when you
				don't understand something - this is the whole reason behind this
				language exchange: for you to be able to follow the conversation and
				participate! Ask your partners to slow down if they speak too fast.
				Make an effort to speak out, even if you're shy. 3. Be Sensitive to
				Your Partners' Needs (when speaking in your language) When speaking
				in your own language, please keep in mind that you're doing this so
				your partners can practice - encourage them to participate, and make
				sure they can follow the conversation. Explain, repeat, write down
				or translate when necessary, and slow down if your partners ask you
				to. If someone says a word that you don't understand (because of
				poor pronunciation, for example), just ask them to write it in the
				text box, then say it for them. Pronunciation is important!
				Encourage those who are too shy to speak. For example, you can ask:
				"What do you think, Lolita? You've been very quiet." Don't correct
				grammar all the time. 4. Giving Corrections Strive for
				communication, not correction. Our goal is to communicate and be
				understood. Don't correct grammar all the time, and especially do
				not interrupt someone in the middle of a sentence to correct him or
				her - too much correction interferes with the conversation and can
				frustrate and block speakers. Do however clear up errors that
				interfere with understanding. If someone insists on being corrected,
				ask him or her what he or she wants you to focus on: verbs,
				prepositions, pronunciation, gender, etc. The best way to correct is
				to just repeat the word or phrase the way you would say it, even if
				it is not proper language. No need to explain anything unless the
				person asks. 5. Be Considerate Speak loudly and clearly - think of
				when you give an address over the phone. Give everyone a chance to
				speak - don't monopolize the conversation. Develop a listening
				attitude. Allow others their point of view - you can comment, but
				don't judge. If you're in a large group and decide to write private
				messages to someone, please tell others and try to find another room
				to practice. Practice Regularly, and Have Fun! Practice regularly.
				It's like physical exercise: a little here and there is fun, but not
				very effective. You need regular, quality practice to see results.
				It's also easier to organize if you practice regularly with the same
				partners. Please do not skip the warm-ups. They may not seem very
				challenging - and maybe a little silly - but that's the point. Those
				games are designed to help everyone relax and be comfortable in
				order to benefit from the practice. Relax and enjoy! Report
				Disruptive Behavior This site is for learning and we strive for a
				positive, relaxed atmosphere. Abusive behavior will not be
				tolerated. If anyone is being inconsiderate, gently (politely)
				remind him or her of these language exchange guidelines. If the
				person repeatedly disrupts your practice, or doesn't respect
				everyone's practice time, please email us about it.</p>
		</div>
	</div>
	<div id="footer" class="container">
		<h2>Copyright © 2018-2019 Exlang.com</h2>
		<p>Featuring 15 languages, including...</p>	
		<hr size="1" width="100%" align="center" noshade>
		<p> English Spanish French Italian German Japanese Swedish Greek Arabic <p>
		<p>  Korean Chinese Russian Thai <p>
	</div>
</body>
</html>
