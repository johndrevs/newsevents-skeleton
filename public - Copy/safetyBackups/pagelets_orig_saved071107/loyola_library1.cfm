
<cfquery name="getpost" datasource="#application.datasource_select#">
SELECT site_name, siteid
FROM CUNVMCS.sites
</cfquery>

<cfquery name="getaudiences" datasource="#application.datasource_select#">
SELECT title,audienceid
from CUNVMCS.audiences
</cfquery>

<cfquery name="getlocations" datasource="#application.datasource_select#">
SELECT location_name,locationid
from CUNVMCS.locations
where locationid<>3 and isactive=1
</cfquery>


<cfinclude template="/newsevents/public/ssi/header_61807.cfm">

	<div id="content_text">
	
<h2>Loyola Authored Library<h2>


<p><a href="http://www.luc.edu/alumni/getupdated_alumniauthors.shtml" target="_blank">Alumni Authors</a> | <a href="archive.shtml">Authors Archive</a> | <a href="form.shtml">Submit an Entry</a> | <a href="mailto:lschnel@luc.edu">Contact Us</a> |</p>

<hr noshade size="1">

<p>&nbsp;</p>
<table class="tabular" width="100%">
<tr><th colspan="3">Featured Authors</th></tr>
<tr>
<td width="30%">
<!--
<div class="callout"><a name="a"></a><strong>A</strong><br />
<li><a href="#k.adams">Kathleen M. Adams, PhD</a></li></div>
-->
<a name="a"></a><strong>A</strong><br />
<li><a href="#k.adams">Kathleen M. Adams, PhD</a></li>
<hr noshade>
<a name="b"></a><strong>B</strong><br />
<li><a href="#d.berger">Dina Berger, PhD</a></li><br />
<li><a href="#j.boatright">John Boatright, PhD</a></li><br />
<li><a href="#bosco">Dr. Mark G. Bosco, SJ</a></li><br />
<li><a href="#f.bryant">Fred B. Bryant, PhD</a></li>
<li><a href="#r.bucholz">Robert Bucholz, PhD</a></li>
<hr noshade>
<a name="c"></a><strong>C</strong><br />
<li><a href="#caldwell">Laura Caldwell, JD</a></li>
<li><a href="#d.chinitz">David E. Chinitz, PhD</a></li>
<li><a href="#m.cinar">Mine E. Cinar, PhD</a></li>
<hr noshade>
<a name="e"></a><strong>E</strong><br />
<li><a href="#erenberg">Lewis Erenberg, PhD</a></li>
<hr noshade>
<a name="f"></a><strong>F</strong><br />
<li><a href="#s.fox">Suzy Fox, PhD</a></li><br />
<hr noshade>
<a name="g"></a><strong>G</strong><br />
<li><a href="#a.gini">Al Gini, PhD</a></li>
<hr noshade>
<a name="i"></a><strong>I</strong><br />
<li><a href="#d.ingram">David Ingram, PhD</a></li>
<hr noshade>
<a name="j"></a><strong>J</strong><br />
<li><a href="#c.johnson">Christian A. Johnson, JD</a></li>
<li><a href="#p.jung">Patricia Beattie Jung, PhD</a></li>
</td>
<td width="35%">
<a name="k"></a><strong>K</strong><br />
<li><a href="#t.karamanski">Theodore J. Karamanski, PhD</a></li><br />
<li><a href="#g.kaufman">George G. Kaufman, PhD</a></li>
<hr noshade>
<a name="l"></a><strong>L</strong><br />
<li><a href="archive_nlash.shtml">Nicholas Lash, PhD</a></li><br />
<li><a href="#lavelle">Brian Lavelle, PhD</a></li>
<hr noshade>
<a name="m"></a><strong>M</strong><br />
<li><a href="#t.malliaris">A.G. Malliaris, PhD</a></li>
<li><a href="#e.maor">Eli Maor, PhD</a></li>
<li><a href="#a.mcdonald">Anne Leggett McDonald, PhD</a></li>
<li><a href="#s.mezey">Susan Mezey, PhD</a></li>
<li><a href="#l.miller">Laura Miller, PhD</a></li>
<hr noshade>
<a name="n"></a><strong>N</strong><br />
<li><a href="#j.nicholas">John Nicholas, PhD</a></li>
<hr noshade>
<a name="o"></a><strong>O</strong><br />
<li><a href="#ogorman">Robert T. O'Gorman, PhD</a></li>
<hr noshade>
<a name="p"></a><strong>P</strong><br />
<li><a href="#k.parsi">Kayhan Parsi, JD, PhD</a></li><br />
<li><a href="#j.pelissero">John P. Pelissero, PhD</a></li><br />
<li><a href="#a.peperzak">Adriaan Theodoor Peperzak, PhD</a></li>
<li><a href="#t.pintchman">Tracy Pintchman, PhD</a></li>
</td>

<td width="35%">
<a name="r"></a><strong>R</strong><br />
<li><a href="#nurses">C. H. Smeltzer, F. R. Vlasses, C. R. Robinson</a></li><br />
<li><a href="#b.rosenwein">Barbara H. Rosenwein, PhD</a></li>
<li><a href="#s.ross">Susan A. Ross, PhD</a></li>
<hr noshade>
<a name="s"></a><strong>S</strong><br />
<li><a href="#p.sanchez">Peter M. Sanchez, PhD</a></li>
<li><a href="#d.schweickart">David Schweickart, PhD</a></li>
<li><a href="#nurses">C. H. Smeltzer, F. R. Vlasses, C. R. Robinson</a></li><br />
<li><a href="archive_sstasch.shtml">Stanley Stasch, PhD</a></li><br />
<li><a href="#l.stroh">Linda Stroh, PhD</a></li>
<hr noshade>
<a name="t"></a><strong>T</strong><br />
<li><a href="#twadell">Phyllis Ann Solari-Twadell, PhD</a></li>
<hr noshade>
<a name="v"></a><strong>V</strong><br />
<li><a href="#a.vigen">Aana Marie Vigen, PhD</a></li><br />
<li><a href="#nurses">C. H. Smeltzer, F. R. Vlasses, C. R. Robinson</a></li>
<hr noshade>
<a name="w"></a><strong>W</strong><br />
<li><a href="#s.waller">Spencer Weber Waller, JD</a></li>
</td>
</tr>
</table>

<p>&nbsp;</p>
<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<p>&nbsp;</p>

<a name="t.pintchman"></a>
<h2 class="subHeaderText"><strong>Tracy Pintchman, PhD</strong></h2><img src="images/pintchman_womenslives.JPG" align="right" alt="Women's Lives, Women's Rituals in the Hindu Tradition" hspace="2">
Professor, Theology
<br /><br />
<h3><em>Women's Lives, Women's Rituals in the Hindu Tradition</em></h3>


<p><strong>Oxford University Press: 2007<br>
(ISBN: 978-0195177077)</strong></p>

<p><strong>Synopsis</strong><br>
This book explores the complex relationship between Hindu women's rituals and their lives beyond ritual. The book focuses particularly on the relationship of women's ritual practices to domesticity, exposing and exploring the nuances, complexities, and limits of this relationship. In many cultural and historical contexts, including contemporary India, women's everyday lives tend to revolve heavily around domestic and interpersonal concerns, especially care for children, the home, husbands, and other relatives. Hence, women's religiosity also tends to emphasize the domestic realm and the relationships most central to women. But women's religious concerns certainly extend beyond domesticity. Furthermore, even the domestic religious activities that Hindu women perform may not merely replicate or affirm traditionally formulated domestic ideals but may function strategically to reconfigure, reinterpret, criticize, or even reject such ideals. This volume takes a fresh look at issues of the relationship between Hindu women's ritual practices and normative domesticity. In so doing, it emphasizes female innovation and agency in constituting and transforming both ritual and the domestic realm and calls attention to the limitations of normative domesticity as a category relevant to many forms of Hindu women's religious practice.  
</p>

<h3><em>Guests at God's Wedding</em></h3><img src="images/pintchman_guests.JPG" align="right" alt="Guests at God's Wedding" hspace="2">

<p><strong>State University of New York Press: 2005<br>
(ISBN: 978-0-7914-6595-0)</strong></p>

<p><strong>Synopsis</strong><br>
This book explores the sacred Hindu month of Kartik (October/November) as it is celebrated in the city of Benares in North India, highlighting Kartik-related practices, stories, songs, and experiences particular to women. During Kartik, Hindu women living in and around Benares meet daily to enact a form of ritual worship, or puja, in which they raise the playful Hindu deity Krishna from childhood to adulthood throughout the month, ultimately marrying him to the plant-goddessTulsi (Basil). Tracy Pintchman explores how women who perform Kartik puja understand and celebrate both Kartik and Krishna in ways that are linked to the desires, hopes, fears, and social realities characteristic of many Hindu women living in the rather conservative social milieu of this region. </p>

<p><strong><a href="archive_pintchman.shtml">Click here</a> to view other books by Dr. Pintchman.</strong></p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="e.maor"></a>
<h2 class="subHeaderText"><strong>Eli Maor, PhD</strong></h2>
Adjunct Professor, Mathematics
<br /><br />
<h3><em>The Pythagorean Theorem: A 4,000-Year History</em></h3>


<p><strong>Princeton University Press: May 2007<br>
(ISBN 13: 978-0-691-12526-8)</strong></p>

<p><strong>Synopsis</strong><br>
By any measure, the Pythagorean theorem is the most famous statement in all of mathematics, one remembered from high school geometry class by even the most math-phobic students. Well over four hundred proofs are known to exist, including ones by a twelve-year-old Einstein, a young blind girl, Leonardo da Vinci, and a future president of the United States. Here&mdash;perhaps for the first time in English&mdash;is the full story of this famous theorem.
<br /><br />
Although attributed to Pythagoras, the theorem was known to the Babylonians more than a thousand years before him. He may have been the first to prove it, but his proof&mdash;if indeed he had one&mdash;is lost to us. Euclid immortalized it as Proposition 47 in his Elements, and it is from there that it has passed down to generations of students. The theorem is central to almost every branch of science, pure or applied. It has even been proposed as a means to communicate with extraterrestrial beings, if and when we discover them. And, expanded to four-dimensional space-time, it plays a pivotal role in Einstein's theory of relativity.
<br /><br />
In this book, Eli Maor brings to life many of the characters that played a role in the development of the Pythagorean theorem, providing a fascinating backdrop to perhaps our oldest enduring mathematical legacy.
<br /><br />
Eli Maor teaches the history of mathematics at Loyola University in Chicago. He is the author of Venus in Transit, Trigonometric Delights, e: The Story of a Number, and To Infinity and Beyond: A Cultural History of the Infinite (all Princeton).
</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="d.ingram"></a>
<h2 class="subHeaderText"><strong>David Ingram, PhD</strong></h2>
Professor, Philosophy
<br /><br />
<h3><em>Law: Key Concepts in Law</em></h3>

<p><strong>Continuum: November 2006<br>
(ISBN 0 8264 7822 0)</strong></p>

<p><strong>Synopsis</strong><br>
Drawing upon both the analytic Anglo-American and Continental schools of philosophy, Law: Key Concepts in Philosophy (published November 2006) summarizes the work of key thinkers in the philosophy of law, including Aquinas, Rousseau, Hobbes, Kant, Bentham, Austin, Hegel, Habermas, Arendt, Kelsen, Schmitt, Foucault, Mill, Marx, Dworkin, Hart, Ely and Ackerman. It provides a thorough discussion of central divisions and movements in legal philosophy, covering criminal law, civil law, social law, constitutional law, international law, natural law, positivism, formalism, realism, law and economics, and Critical Legal Studies. It also addresses key issues in contemporary philosophy of law, including human rights, affirmative action, capital punishment, gay rights, civil disobedience, and institutional racism, sexism and classism. The author, David Ingram, is Professor of Philosophy at Loyola University, Chicago, Illinois. He is the author (with Jennifer Parks) of The  Complete Idiot's Guide to Understanding Ethics. 
</p>

<br /><br />
<h3><em>Rights, Democracy, and Fulfillment in the Era of Identity Politics: Principled Compromises in a Compromised World</em></h3>

<p><strong>Rowman and Littlefield: 2004<br>
(ISBN 0 7425 3348 4)</strong></p>

<p><strong>Synopsis</strong><br>
Rights, Democracy, and Fulfillment in the Era of Identity Politics develops a critical theory of human rights and global democracy. Ingram both develops a theory of rights and applies it to a range of concrete and timely issues, such as the persistence of racism in contemporary American society; the emergence of so-called "whiteness theory;" the failure of identity politics; the tensions between emphases on antidiscrimination and affirmative action in the Americans With Disabilities Act of 1990; the great unresolved issues of workplace democracy; and the dilemmas of immigration policy for the U.S. and Europe.
</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="d.berger"></a>
<h2 class="subHeaderText"><strong>Dina Berger, PhD</strong></h2>
Assistant Professor, History
<br /><br />
<h3><em>The Development of Mexico's Tourism Industry: Pyramids by Day, Martinis by Night</em></h3>


<p><strong>Palgrave Macmillan: 2006<br>
(ISBN 1403966354)</strong></p>

<p><strong>Synopsis</strong><br>
Today, tourism is one of Mexico's most successful revolutionary projects that played a decisive role in the making of that modern nation. From the industry's birth in 1928 to its boom in 1946, government officials and private entrepreneurs coalesced around tourism to study, develop, and promote it as a development strategy that fulfilled revolutionary goals. Through savvy promotional campaigns that professed goodwill and showcased the modern ("martinis") and the traditional ("pyramids"), tourist boosters refashioned their nation's image from an unruly to a good neighbor successfully attracting U.S. tourists. This pioneering study demystifies the emergence of modern tourism and demonstrates how tourist boosters capitalized on broader shifts in U.S.-Mexican relations.
</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="p.jung"></a>
<h2 class="subHeaderText"><strong>Patricia Beattie Jung, PhD</strong></h2>
Professor, Theology
<br /><br />
<h3><em>Good Sex: Feminist Perspectives from the World's Religions</em></h3>


<p><strong>Rutgers University Press: 2005<br>
(ISBN 0813528844)</strong></p>

<p><strong>Synopsis</strong><br>
Co-dited with Mary E. Hunt and Radhika Balakrishnan
</p>

<br /><br />
<h3><em> Moral Issues and Christian Responses (Seventh Edition)</em></h3>


<p><strong>Thompspn/Wadsworth: 2003<br>
(ISBN 0155058959)</strong></p>

<p><strong>Synopsis</strong><br>
Co-edited with Shannon Jung.
</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />


<a name="r.bucholz"></a>
<h2 class="subHeaderText"><strong>Robert Bucholz, PhD</strong></h2><img src="images/bucholz_early.jpg" align="right" alt="Early Modern England 1485-1714:  a Narrative History" hspace="2">
Professor, History<br />
<a href="http://www.luc.edu/depts/history/bucholz/bucholz.htm" target="_blank">About Dr. Buchlolz</a>
<br /><br />
<h3><em>Early Modern England 1485-1714:  a Narrative History</em></h3>


<p><strong>Blackwell: 2003<br>
(ISBN-10: 0631213937)</strong></p>

<p><strong>Synopsis</strong><br>
Under the Tudors and Stuarts, England transformed itself from a feudal and relatively minor European state into a constitutional monarchy and the wealthiest and most powerful nation on Earth.  This book tells the story of that transformation, as well as how social and cultural changes affected ordinary English men and women.  During this period, the English people survived repeated epidemics and famines, one failed invasion and two successful ones, two civil wars,  and a series of violent religious reformations and counter-reformations.  They confronted, successfully, two of the most powerful monarchs on Earth, Philip II of Spain and Louis XIV of France.  Along the way they produced one of the world's great cultures, including the philosophy of John Locke, the plays of Shakespeare, the wit of Swift, the poetry of Milton, the buildings of Wren, the science of Newton, and the magnificent cadences of the King James Bible and the Book of Common Prayer.  They also visited cruelty, bloodshed, and religious oppression on the inhabitants of Ireland, Scotland and their colonies overseas.  And yet, at their best, they established many of the political principles and ideals which would eventually enable those peoples to achieve some measure of justice, and upon which we Americans would build our own nation.  
<br /><br />
"This excellent book is consciously designed for students in North American universities who are studying this period for the first time, but its qualities are such that British students will find it a remarkably effective and well-sustained synthesis. The narrative is readable, fluent and balanced.... Throughout, the authors, both of whom are vastly experienced teachers as well as being active research scholars, have managed to delineate detail effectively without obscuring the narrative flow.... It is, as they say in their conclusion, 'a terrific story', and they have told it terrifically well." David L. Smith, Selwyn College, Cambridge 
<br /><br />
"Written especially for North American students, Early Modern England 1485-1714 is an informative and engaging survey text that will draw undergraduates into the period. Bucholz and Key provide a compelling narrative as well as interpretive perspectives that reflect the most recent scholarship." Gary De Krey, St. Olaf College   
<br /><br />
"This text is a delight to read. One is immediately struck by the sparkling yet highly accessible prose. Bucholz and Key designed it specifically for the American college student, who will undoubtedly find it a pleasure rather than a burden to read. Finally, the Queen's English, American-style." Melinda Zook, Purdue University
</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />



<a name="d.chinitz"></a>
<h2 class="subHeaderText"><strong>David E Chinitz, PhD</strong></h2>
Associate Professor, English
<br /><br />
<h3><em>T. S. Eliot and the Cultural Divide</em></h3>


<p><strong>University of Chicago Press: Oct. 2003 (paperback Dec. 2005)<br>
(ISBN 0226104478 (0226104184))</strong></p>

<p><strong>Synopsis</strong><br>
The modernist poet T. S. Eliot has been applauded and denounced for decades as a staunch champion of high art and an implacable opponent of popular culture. But Eliot's elitism was never what it seemed. T. S. Eliot and the Cultural Divide refurbishes this great writer for the twenty-first century, presenting him as the complex figure he was, an artist attentive not only to literature but to detective fiction, vaudeville theater, jazz, and the songs of Tin Pan Alley.
<br /><br />
David Chinitz argues that Eliot was productively engaged with popular culture in some form at every stage of his career, and that his response to it, as expressed in his poetry, plays, and essays, was ambivalent rather than hostile. He shows that American jazz, for example, was a major influence on Eliot's poetry during its maturation. He discusses Eliot's surprisingly persistent interest in popular culture both in such famous works as The Waste Land and in such lesser-known pieces as Sweeney Agonistes. And he traces Eliot's long, quixotic struggle to close the widening gap between high art and popular culture through a new type of public art: contemporary popular verse drama.
<br /><br />
What results is a work that will persuade adherents and detractors alike to return to Eliot and find in him a writer who liked a good show, a good thriller, and a good tune, as well as a "great" poem.
</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="m.cinar"></a>
<h2 class="subHeaderText"><strong>Mine E. Cinar, PhD</strong></h2>
Professor, Economics
<br /><br />
<h3><em>The Economics of Women and Work in Middle East and North Africa</em></h3>


<p><strong>JAI/Elsevier: 2001<br>
(ISBN 0-7623-0714-5)</strong></p>

<p><strong>Synopsis</strong><br>
This volume in the Middle East Economic Association research series  brings together a series of articles on a very important, but under-researched issue. A critical source of inefficiency in the region.  is the status of women, as evidenced by large gender gaps in literacy, education, formal sector labor participation, legal rights and job opportunities. The topics covered in this volume range from cross-country comparisons of women's economic situation, with an emphasis on employment trends and macro-gender statistics, to micro level studies of employment and fertility patterns for a number of Middle Eastern and North African countries, including Egypt, Turkey, Palestine and Iran.
</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="a.mcdonald"></a>
<h2 class="subHeaderText"><strong>Anne Leggett McDonald, PhD</strong></h2><img src="images/mcdonald_complexities.gif" align="right" alt="Complexities:  Women in Mathematics" hspace="2">
Associate Professor, Mathematics
<br /><br />
<h3><em>Complexities:  Women in Mathematics</em></h3>
<p><em>Co-author: Bettye Anne Case</em></p>

<p><strong>Princeton University Press: 2005<br>
(ISBN 978-0-691-11462-0)</strong></p>

<p><strong>Synopsis</strong><br>
Sophie Germain taught herself mathematics by candlelight, huddled in her bedclothes. Ada Byron Lovelace anticipated aspects of general-purpose digital computing by more than a century. Cora Ratto de Sadosky advanced messages of tolerance and equality while sharing her mathematical talents with generations of students.
<br /><br />
This captivating book gives voice to women mathematicians from the late eighteenth century through to the present day. It documents the complex nature of the conditions women around the world have faced&mdash;and continue to face&mdash;while pursuing their careers in mathematics. The stories of the three women above and those of many more appear here. The earlier parts of the book provide historical context and perspective, beginning with excursions into the lives of fifteen women born before 1920. Included are histories of collective efforts to improve women's opportunities in research mathematics. In addition, a photo essay puts a human face on the subject as it illustrates women's contributions in professional associations.
<br /><br />
More than eighty women from academe, government, and the private sector provide a rich m&eacute;lange of insights and strategies for creating workable career paths while maintaining rewarding personal lives. The book discusses related social and cultural issues, and includes a summary of recent comparative data relating to women and men in mathematics and women from other sciences. First-person accounts provide explicit how-tos; many narratives demonstrate great determination and perseverance. Talented women vividly portray their pleasure in discovering new mathematics. The senior among them speak out candidly, interweaving their mathematics with autobiographical detail. At the beginning of a new century, women at all stages of their careers share their outlooks and experiences.

</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="s.mezey"></a>
<h2 class="subHeaderText"><strong>Susan Mezey, PhD</strong></h2><img src="images/mezey_queers.gif" align="right" alt="Queers in Court: Gay Rights Law and Public Policy" hspace="2">
Professor,  Political Science
<br /><br />
<h3><em>Queers in Court: Gay Rights Law and Public Policy</em></h3>

<p><strong>Rowman and Littlefield: 2007<br>
(ISBN 978-0-7425-4932-6)</strong></p>

<p><strong>Synopsis</strong><br>
This book weighs the effectiveness in litigation in furthering the goals of the gay community by examining the efforts of gay men and women in the United States to challenge discriminatory laws and social norms. Based on their common experiences of exclusion and oppression, gays and lesbians adopted the rhetoric of equality of rights under the law from other minority groups. Like women and racial minorities, lesbians and gays believe the courts a likely arena in which to challenge inequality and turned to the judiciary to vindicate their rights through litigation. 
 <br /><br />
The contents of the book include the gay rights movement in historical context, United States Supreme Court decision making in equality and privacy cases, same sex marriage, the exclusion of gays from military service, and employment discrimination. In examining gay rights litigation over the past five decades, it  explores such questions as the extent to which erotic material for a gay audience should be censored; whether the right to privacy is broad enough to encompass same sex conduct; whether private organizations should be permitted to exclude gays from membership or participation in their activities; whether same sex marriages should be legally recognized and granted full panoply of rights adhering to marriage; whether gay men and lesbians should be permitted to serve openly in the military; and whether laws against employment discrimination should apply to gays as they do to other minority groups. 
</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />


<a name="d.schweickart"></a>
<h2 class="subHeaderText"><strong>David Schweickart, PhD</strong></h2>
Professor,  Philosophy<br>
<a href="http://orion.it.luc.edu/~dschwei/" target="_blank">About Dr. Schweickart</a>
<br /><br />
<h3><em>After Capitalism</em></h3>

<p><strong>Rowman and Littlefield: 2002<br>
(ISBN 0-7425-1300-9)</strong></p>

<p><strong>Synopsis</strong><br>
In After Capitalism, David Schweickart moves beyond the familiar arguments against globalizing capitalism to contribute something absolutely necessary and long overdue&mdash;a coherent vision of a viable, desirable alternative to capitalism.  He names this system Economic Democracy, a successor-system to capitalism which preserves the efficiency strengths of a market economy while extending democracy to the workplace and to the structures of investment finance.  Drawing on both theoretical and empirical research, Schweickart shows how and why this model is efficient, dynamic and superior to capitalism along a range of values.</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="j.nicholas"></a>
<h2 class="subHeaderText"><strong>John Nicholas, PhD</strong></h2><img src="images/nicholas_lean.gif" align="right" alt="The Portal to Lean Production" hspace="2">
Professor,  ISOM
<br /><br />
<h3><em>The Portal to Lean Production</em></h3>

<p><strong>Auerbach Publications: 2006<br>
(ISBN 0-8493-5031-X)</strong></p>

<p><strong>Synopsis</strong><br>
<p>The Portal to Lean Production:  Principles and Practices for Doing More with Less describes the steps, difficulties, and rewards of implementing lean production.  The book moves beyond concepts to address practical matters.  The authors provide enough information for the reader to begin implementing lean production within the organization.</p>

<p>The book applies a model "the Portal to Lean Production" to illustrate lean production principles and practices.  The model reappears throughout the books and serves to connect the concepts of each chapter with those in other chapters, and with basic lean production principles.</p>

<p>The book contains many short vignettes of actual lean production implementations.  Following these examples, the text provides expanded coverage of topics to enable the reader to learn and apply the broader concepts and principles of lean production.  The vignettes, based upon the work experience of co-author Avi Soni, connect the concepts and provide practical examples.</p>

<p>Features:<br>
<li>The Portal to lean Production, a model that shows the philosophy, principles, and methods of lean production</li>
<li>The steps, difficulties, and rewards of implementing lean production</li>
<li>In-depth description of concepts with numerous examples and figures</li>
<li>Examples using formulae and explaining the kind of data needed</li></p>

</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />


<a name="p.sanchez"></a>
<h2 class="subHeaderText"><strong>Peter M. Sanchez, PhD</strong></h2>
Associate Professor,  Political Science<br>
<a href="http://www.luc.edu/depts/polisci/department.htm#sanchez" target="_blank">About Dr. Sanchez</a>
<br /><br />
<h3><em>Panama Lost? U.S. Hegemony, Democracy, and the Canal</em></h3>

<p><strong>University Press of Florida: 2007<br>
(ISBN 0-8130-9780813030463)</strong></p>

<p><strong>Synopsis</strong><br>
Peter Sanchez tells the story of how Panama, though one of the smallest Latin American countries, played the largest symbolic role in America's ascent to world power status, particularly during the United States' almost century-long occupation of the Canal Zone from 1903 until Dec. 31, 1999. The United States would undoubtedly have become a great power without the Isthmus of Panama, but more than any other country in the hemisphere, Panama has served as a critical outpost for U.S. power and as an instrument for U.S. military and economic might. Sanchez argues that the United States' policies toward Panama motivated principally by the goal of preserving their hegemony in Latin America produced a formidable barrier to developing democratic politics in Panama.  <br /><br />Examining key events and personalities in Panama's political history from the 1850s to the present, this comprehensive survey analyzes U.S.-Panama relations through the 1989 removal of General Manuel Noriega by U.S. armed forces and the final disposition of the Panama Canal Treaties, culminating in the return of all canal-related lands to the Panama government. This book is foremost a study of power relationships, demonstrating how domestic political development cannot be understood fully without taking power at the international level into consideration. Combining theory, case study, and policy relevance, this volume makes significant contributions to both comparative politics and international relations theory, showing that domestic and international politics are two sides of one coin.  Featuring a comprehensive bibliography of material in both Spanish and English, the book will be a key resource not only for Latin Americanists but for anyone interested in the process of democratization and the effects of the international system on domestic political development.</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="f.bryant"></a>
<h2 class="subHeaderText"><strong>Fred B. Bryant, PhD</strong></h2><img src="images/bryant_savoring.gif" align="right" alt="Savoring: A New Model of Positive Experience" hspace="2">
Professor of Psychology<br>
<a href="http://www.luc.edu/psychology/facultystaff/bryant_f.shtml" target="_blank">About Dr. Bryant</a>
<br /><br />
<h3><em>Savoring: A New Model of Positive Experience</em></h3>

<p><strong>Lawrence Erlbaum Associates, Inc.: 2007<br>
(ISBN 0-8058-5119-4)</strong></p>

<p><strong>Synopsis</strong><br>
This book summarizes my past 25 years of research on the psychology of joy. The book is about savoring life-the capacity to attend to the joys, pleasures, and other positive feelings that we experience in our lives. The book is intended to enhance our understanding of what savoring is and the conditions under which it occurs. Savoring provides a new theoretical model for conceptualizing and understanding the psychology of enjoyment and the processes through which people manage positive emotions. In the book, we review our quantitative research on savoring, as well as the research of others, and provide measurement instruments with scoring instructions for assessing and studying savoring. 
<br /><br />
The book outlines the necessary preconditions that must exist for savoring to occur and distinguishes savoring from related concepts such as coping, pleasure, positive affect, emotional intelligence, flow, and meditation. The book's lifespan perspective includes a conceptual analysis of the role of time in savoring. We also consider savoring in relation to human concerns, such as love, friendship, physical and mental health, creativity, and spirituality. In addition, we provide strategies and hands-on exercises that people can use to enhance savoring in their lives, along with a review of factors that enhance savoring.
<br /><br />
Savoring is intended for researchers, students, and practitioners interested in positive psychology from the fields of social, clinical, health, and personality psychology and related disciplines. The book may serve as a supplemental text in courses on positive psychology, emotion and motivation, and other related topics. The chapters on enhancing savoring will be especially attractive to clinicians and counselors interested in intervention strategies for positive psychological adjustment.
</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="g.kaufman"></a>
<h2 class="subHeaderText"><strong>George Kaufman, PhD</strong></h2><img src="images/kaufman_crossborder.gif" align="right" alt="Cross Border Banking: Regulatory Challenges" hspace="2">
Professor, School of Business<br>
<a href="http://www.gsb.luc.edu/facultystaff/about_facultydetail.cfm?EID=gkaufma@luc.edu" target="_blank">About Dr. Kaufman</a>
<br /><br />
<h3><em>Cross Border Banking: Regulatory Challenges</em></h3>

<p><strong>World Scientific: 2006<br>
(ISBN 981-256-829-8)</strong></p>

<p><strong>Synopsis</strong><br>
Cross-border banking, while having the potential for a more efficient financial sector, also creates potential challenges for bank supervisors and regulators.  It requires cooperation by regulatory authorities across jurisdictions and a clear delineation of authority and responsibility.  That delineation is typically not present and regulatory authorities often have significant different incentives to respond when cross-border-active banks encounter difficulties.  Most of these issues have only begun to be seriously evaluated.  
<br /><br />
This volume, one of the first attempts to address these issues, brings together experts and regulators from different countries.  The wide range of topics discussed include:  the current landscape of cross-border bank activity, the resulting competitive implications, emerging challenges for prudential regulation, safety net concerns, failure resolution issues, and the potential future evolution of international banking.
</p>

<p><strong><a href="archive_gkaufman.shtml">Click here</a> to view other books by Dr. Kaufman.</strong></p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />


<a name="s.ross"></a>
<h2 class="subHeaderText"><strong>Susan A. Ross, PhD</strong></h2>
Professor and Faculty Scholar, Theology<br>
<a href="http://www.luc.edu/theology/facultystaff/faculty_layout_15_35939_33839.shtml" target="_blank">About Dr. Ross</a>
<br /><br />
<h3><em>For the Beauty of the Earth: women, Sacramentality, and Justice</em></h3>

<p><strong>Paulist Press: November 2006<br>
(ISBN 0-8091-4422-0)</strong></p>

<p><strong>Synopsis</strong><br>
This book offers a feminist theological and ethical exploration of women and beauty "from the ground up." Drawing on women's activities as sources of insight into the nature of beauty, and as inspiration for connecting beauty and goodness, Ross presents a unique reflection that will offer challenges to anyone interested in theological aesthetics or women's issues.
</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />


<a name="l.miller"></a>
<h2 class="subHeaderText"><strong>Laura Miller, PhD</strong></h2><img src="images/miller_beautyup.gif" align="right" alt="Beauty Up: Exploring Contemporary Japanese Body Aesthetics" hspace="2">
Professor, Anthropology<br>
<a href="http://www.luc.edu/depts/anthropology/LM/millerl.htm" target="_blank">About Dr. Miller</a>
<br /><br />
<h3><em>Beauty Up: Exploring Contemporary Japanese Body Aesthetics</em></h3>

<p><strong>University of California Press: June 2006<br>
(ISBN 978-0-520-24509-9)</strong></p>

<p><strong>Synopsis</strong><br>
This engaging introduction to Japan's burgeoning beauty culture investigates a wide range of phenomenon&mdash;aesthetic salons, dieting products, male beauty activities, and beauty language&mdash;to find out why Japanese women and men are paying so much attention to their bodies. Laura Miller uses social science and popular culture  sources to connect breast enhancements, eyelid surgery, body hair removal, nipple bleaching, and other beauty work to larger issues of gender ideology, the culturally-constructed nature of beauty ideals, and the globalization of beauty technologies and standards. Her sophisticated treatment of this timely topic suggests that new body aesthetics are not forms of "deracializiation" but rather innovative experimentation with identity management. While recognizing that these beauty  activities are potentially a form of resistance, Miller also considers the commodification of beauty, exploring how new ideals and technologies are tying consumers even more firmly to an ever-expanding beauty industry. By considering beauty in a Japanese context, Miller challenges widespread assumptions.</p>

<p><strong><a href="archive_lmiller.shtml">Click here</a> to view other books by Dr. Miller.</strong></p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="j.pelissero"></a>
<h2 class="subHeaderText"><strong>John P. Pelissero, PhD</strong></h2><img src="images/pelissero_mua6.jpg" align="right" alt="Managing Urban America" hspace="2">
Professor, Political Science<br>
<a href="http://homepages.luc.edu/~jpeliss/" target="_blank">About Dr. Pelissero</a>
<br /><br />
<h3><em>Managing Urban America</em></h3>

<p><strong>CQ Press: 2006<br>
(ISBN 1-56802-930-6)</strong></p>

<p><strong>Synopsis</strong><br>
Urban managers continue to do what they have done for decades: manage conflict, adapt to shifting demographics, balance their own source funds with intergovernmental revenues, respond to federal and state mandates, negotiate with other localities in their same metropolitan area, and deliver goods and services. But managers today are confronted with new challenges in what has become "fend for yourself"  federalism. City executives must do more with less while at the same time figure out ways to harness the power of new technologies and react to a globalized world and economy. It is no wonder then that even great managers can fail at urban administration. To succeed, they must understand the nature of community values, the pitfalls of bureaucratic inertia, and the craft of leadership&mdash;that is, the politics of urban management.
<br /><br />
This book, co-authored by David R. Morgan, Robert E. England, and John P. Pelissero, offers a forward-looking account of this new urban management environment.  Featuring discussions of the New Public Management model, the impacts of globalization, changes in service delivery, urban planning, economic development, and program evaluation, they discuss key productivity enhancements that emphasize results and accountability. The authors then focus on the impact of citizen participation, e-government, the events of 9/11, and intergovernmental relations as examples of significant environmental factors that impinge on the management of modern cities.
</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="s.fox"></a>
<h2 class="subHeaderText"><strong>Suzy Fox, PhD</strong></h2><img src="images/fox_spwa.gif" align="right" alt="Successful Professional Women of the Americas" hspace="2">
Associate Professor, School of Business<br>
<a href="http://www.sba.luc.edu/faculty/facultydetail.cfm?EID=sfox1@luc.edu" target="_blank">About Dr. Fox</a>
<br /><br />
<h3><em>Successful Professional Women of the Americas</em></h3>

<p><strong>Edward Elgar Publishing Inc.: 2006<br>
(ISBN 1845424379)</strong></p>

<p><strong>Synopsis</strong><br>
This accessible and original book relates the fascinating story of successful women across the Americas: women who are managers, business owners, university professors and administrators, doctors, lawyers and government ministers.
<br /><br />
Based on extensive research, including more than 1,100 surveys and 300 interviews of women from Argentina, Barbados, Brazil, Canada, Chile, Jamaica, Mexico, St Vincent and the Grenadines and the USA, the book aims to explain what these women have in common and how they differ. The workplace challenges and barriers to professional success faced by women are also analysed. Seeking to capture the voices of the women themselves, the authors also from a wide range of backgrounds and cultures across the Americas' attempt to explain success in the face of personal, social, organizational, cultural and economic obstacles facing women everywhere.
<br /><br />
Successful Professional Women of the Americas will provide fascinating reading for academics, students and researchers focusing on gender studies or business and management. Professional women and managers worldwide will also find the book to be of great interest.

</p>


<h3><em>Counterproductive work behavior: investigations of actors and targets</em></h3>

<p><strong>American Psychological Association, 2005<br>
(ISBN 1591471656)</strong></p>


<p><strong>Synopsis (From the Publisher)</strong>: This volume examines the conditions and events in modern organizations that contribute to counterproductive work behavior, as well as the steps organizations might take to combat it. Authors from both North America and Europe analyze the interplay between the environmental factors of the workplace and the personal characteristics of the individual actors and targets of counterproductive work behavior.
</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />


<a name="j.boatright"></a>
<h2 class="subHeaderText"><strong>John Boatright, PhD</strong></h2><img src="images/boatright_busconduct1.gif" align="right" alt="Ethics and the Conduct of Business 5th Edition" hspace="2">
Professor, School of Business<br>
<a href="http://www.gsb.luc.edu/facultystaff/about_facultydetail.cfm?EID=jboatri@luc.edu" target="_blank">About Dr. Boatright</a>
<br /><br />
<h3><em>Ethics and the Conduct of Business 5th Edition</em></h3>

<p><strong>Prentice Hall: 2005<br>
(ISBN 131947214)</strong></p>

<p><strong>Synopsis</strong><br>
This comprehensive and balanced book gives a thorough treatment of the most prominent issues of business ethics and the major positions and arguments on these issues. An abundance of case studies help illustrate topics such as: whistle-blowing, discrimination and affirmative action, occupational health and safety, ethics in finance, and ethics in international business. For professionals in the field who want an up-to-date discussion of the most prominent issues of business ethics. 
</p>

<p><strong><a href="archive_jboatright.shtml">Click here</a> to view other books by Dr. Boatright.</strong></p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="l.stroh"></a>
<h2 class="subHeaderText"><strong>Linda Stroh, PhD</strong></h2><img src="images/stroh_effconsulting.gif" align="right" alt="The Basic Principles of Effective Consulting" hspace="2">
Professor, School of Business<br>
<a href="http://www.gsb.luc.edu/facultystaff/about_facultydetail.cfm?EID=lstroh@luc.edu" target="_blank">About Dr. Stroh</a>
<br /><br />
<h3><em>The Basic Principles of Effective Consulting</em></h3>

<p><strong>Lawrence Erlbaum Associates: 2005<br>
(ISBN 805854207)</strong></p>

<p><strong>Synopsis</strong><br>
This book is written for novice consultants, project managers, staff advisors, and anyone who wants to learn (or be reminded of) the basic principles of effective consulting.  The book is an introduction to consulting and provides a step-by-step process that nearly anyone can learn. We provide numerous examples of real life cases. We tell our reader exactly what to say in the entry interview, how to write a proposal and a contract, how to do a diagnosis, etc, and provide many examples of how  consultants handled difficult situations.  We have also added a set of key success factors at the end of each chapter.  These success factors can be used in multiple ways--as a checklist to validate that you have covered the important steps; as a textbook in the classroom;  or in your company as guidelines for important  topic-relevant discussions/dialogue.  If using the book in the classroom, the success factors could also be turned into student projects.  An important feature of the book are the expert boxes written by successful consultants and users of consultants'  services that are placed at the end of each chapter.  
</p>

<p><strong><a href="archive_lstroh.shtml">Click here</a> to view other books by Dr. Stroh.</strong></p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="h.johnson"></a>
<h2 class="subHeaderText"><strong>Homer Johnson, PhD</strong></h2>
Professor, School of Business<br>
<a href="http://www.gsb.luc.edu/facultystaff/about_facultydetail.cfm?EID=hjohnso@luc.edu" target="_blank">About Dr. Homer Johnson</a>
<br /><br />
<h3><em>The Basic Principles of Effective Consulting</em></h3>

<p><strong> Lawrence Erlbaum Associates, 2005<br>
(ISBN 805854207)</strong></p>

<p><strong>Synopsis</strong><br>
This book is written for novice consultants, project managers, staff advisors, and anyone who wants to learn (or be reminded of) the basic principles of effective consulting.  The book is an introduction to consulting and provides a step-by-step process that nearly anyone can learn. We provide numerous examples of real life cases.  We tell our reader exactly what to say in the entry interview, how to write a proposal and a contract, how to do a diagnosis, etc, and provide many examples of how consultants handled difficult situations.  We have also added a set of key success factors at the end of each chapter.  These success factors can be used in multiple  ways--as a checklist to validate that you have covered the important steps; as a textbook in the classroom;  or in your company as guidelines for important topic-relevant discussions/dialogue.  If using the book in the classroom, the success factors could also be turned into student projects.  An important feature of the book  are the expert boxes written by successful consultants and users of consultants' services that are placed at the end of each chapter. </p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="a.gini"></a>
<h2 class="subHeaderText"><strong>Al Gini, PhD</strong></h2><img src="images/gini_hardtobegood.gif" align="right" hspace="2">
Professor, School of Business<br>
<a href="http://www.gsb.luc.edu/facultystaff/about_facultydetail.cfm?eid=agini@luc.edu&research=yes" target="_blank">About Dr. Gini</a>
<br /><br />
<h3><em>Why It's Hard To Be Good</em></h3>

<p><strong>Routledge: 2005<br>
(ISBN 415972639)</strong></p>

<p><strong>Synopsis</strong><br>
It isn't easy to be good.  In fact, it's very, very difficult.  Al Gini at home both in a philosophy classroom and the corporate boardroom speaks here in an engagingly direct voice about why we have so much trouble doing the right thing in life whether it is at home, with family, or with strangers at work.  Businesses struggle with ethical issues every day, and so do ordinary people.  But a multinational corporation and a single thinking human being are bound together by the same dilemma:  How to choose the right thing to do and then do it?  <br /><br />

<em>Why It's Hard To Be Good</em> examines the concept of stepping out of the shadow of the self to stop thinking only of one's self as the center of the universe.  It's hard to be good, Gini explains, until we realize that being good only has meaning in relation to other people.  Ideas of justice, fairness, and ethical behavior are just that abstract ideas until they are put into action with regard to other people.  Gini argues that we may worry too much about good versus evil big concepts that give us plenty of room to sit on the right side of the equation. Instead, we need to be thinking about how being good involves an active relationship toward the people that surround us.  <br /><br />

This warm and generous book is for anyone who wants to know how to use ethical thinking as way to live, work, and be with others.
</p>

<p><strong><a href="archive_agini.shtml">Click here</a> to view other books by Dr. Gini.</strong></p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="t.malliaris"></a>
<h2 class="subHeaderText"><strong>A.G. Malliaris, PhD</strong></h2><img src="images/tassos_ecouncertaint.gif" align="right" hspace="2">
Professor, School of Business - Economics<br>
<a href="http://homepages.luc.edu/~tmallia/" target="_blank">About Dr. Malliaris</a>
<br /><br />
<h3><em>Economic Uncertainty, Instabilities & Asset Bubbles:  Selected Essays</em></h3>

<p><strong>World Scientific Publishing Co. Pte. Ltd.: 2005<br>
(ISBN 9812563784)</strong></p>

<p><strong>Synopsis</strong><br>
The compendium of papers in this volume focuses on aspects of economic uncertainty, financial instabilities and asset bubbles. <br /><br />

Economic uncertainty is modeled in continuous time using the mathematical techniques of stochastic calculus. A detailed treatment of important topics is provided, including the existence and uniqueness of asymptotic economic growth, the modeling of inflation and interest rates, the decomposition of inflation and its volatility, and the extension of the quantity theory of money to allow for randomness. <br /><br />

The reader is also introduced to the methods of chaotic dynamics, and this methodology is applied to asset pricing, the European equity markets, and the multi-fractality in foreign currency markets. <br /><br />

Since the techniques of stochastic calculus and chaotic dynamics do not readily accommodate the presence of stochastic bubbles, several papers discuss in depth the presence of financial bubbles in asset prices, and econometric work is performed to link such bubbles to monetary policy. <br /><br />

Finally, since bubbles often burst rather than deflate slowly, the last section of the book studies the crash of October 1987 as well as other crashes of national equity markets due to the Persian Gulf crisis. 
</p>

<p><strong><a href="archive_amalliaris.shtml">Click here</a> to view other books by Dr. Malliaris.</strong></p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="a.vigen"></a>
<h2 class="subHeaderText"><strong>Aana Marie Vigen, PhD</strong></h2><img src="images/vigen_womenethics.gif" align="right" hspace="2">
Assistant Professor  of Christian Ethics, Department of Theology<br>
<a href="http://www.luc.edu/theology/facultystaff/vigen.shtml" target="_blank">About Dr. Vigen</a>
<br /><br />
<h3><em>Women, Ethics, and Inequality in U.S. Healthcare:  "To Count Among the Living"</em></h3>

<p><strong>Palgrave Macmillian: 2006<br>
(ISBN 1403973067)</strong></p>

<p><strong>Synopsis</strong><br>
When seriously ill, what contributes to a sense of being truly cared for and respected?  This compelling book explores healthcare inequalities by listening closely to Black and Latina women with breast cancer.  It puts their stories into conversation with current healthcare statistics, sharp theological imagination, healthcare providers, and social ethics.  Vigen contends that ethicists, healthcare providers and scholars arrive at an adequate understanding of human dignity and personhood only when they take seriously the experiences and needs of those most vulnerable due to systemic inequalities.  Fully appreciating these particular lives may make U.S. healthcare more humane for all persons.  
</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />


<a name="k.parsi"></a>
<h2 class="subHeaderText"><strong>Kayhan Parsi, JD, PhD</strong></h2><img src="images/parsi_healingasvocat.gif" align="right" hspace="2">
Assistant Professor, Neiswanger Institute for Bioethics and Health Policy<br>
<a href="http://www.meddean.luc.edu/depts/bioethics/about/people/Parsi_2004.htm" target="_blank">About Dr. Parsi</a>
<br /><br />
<em><strong>Co-editor:</strong> <a href="http://www.lumc.edu/templates/luhs/physearch/primary_lastname_results.cfm?seq_cntr=2021" target="_blank">Myles Sheehan, S.J., M.D.</a></em>
<br /><br />
<h3><em>Healing as Vocation: a Medical Professionalism Primer</em></h3>

<p><strong>Rowman and Littlefield: 2006 (August)<br>
(ISBN 0742534073)</strong></p>

<p><strong>Synopsis</strong><br>
This collection of essays provides educators in medicine and the health sciences an illuminating and challenging introduction to professionalism. The book takes a practical approach toward this topic, looking at what professionalism means, for the individual physician's relationship to his or her patients, to the medical profession as a whole, and to society at large. Written by leading scholars and thinkers in the area of professionalism in medicine, contributors provide a well-rounded analysis of this important topic. Although the intended audience is primarily physicians, medical students and residents, the book is a suitable primer for pre-professional health care students as well.<br><br>For more information, <a href="http://www.rowmanlittlefield.com/Catalog/SingleBook.shtml?command=Search&db=^DB/CATALOG.db&eqSKUdata=0742534073&thepassedurl=[thepassedurl]" target="_blank">click here</a>.
</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="k.adams"></a>
<h2 class="subHeaderText"><strong>Kathleen M. Adams, Ph.D.</strong></h2>
Professor of Anthropology Department <br>
<a href="http://www.luc.edu/depts/anthropology/kma/adams.html" target="_blank">About Dr. Adams</a>
<img src="images/adams_artaspolitics.jpg" align="right" hspace="2">
<br /><br />
<h3><em>Art as Politics: Re-Crafting Identities, Tourism, and Power in Tana Toraja, Indonesia</em></h3>

<p><strong>University of Hawaii Press: 2006 (August)<br>
(ISBN 0-8248-3072-5)</strong></p>

<p><strong>Synopsis</strong><br>
This book explores the intersection of art, identity politics, and tourism in Sulawesi, Indonesia. Based on long-term ethnographic research from the 1980s to the present, the book offers a nuanced portrayal of the Sadan Toraja, a predominantly Christian minority group in the world's most populous Muslim country. Celebrated in anthropological and tourism literatures for their spectacular traditional houses, sculpted effigies of the dead, and pageantry-filled funeral rituals, the Toraja have entered an era of accelerated engagement with the global economy marked by on-going struggles over identity, religion, and social relations.<br /><br />
In her engaging account, Kathleen Adams chronicles how various Toraja individuals and groups have drawn upon artistically-embellished traditional  objects as well as monumental displays, museums, UNESCO ideas about word heritage, and the World Wide Web to shore up or realign aspects of a cultural heritage perceived to be under threat. She also considers how outsiders be they tourists, art collectors, members of rival ethnic groups, or government officials have appropriated and reframed Toraja art objects for their own purposes. Her account illustrates how art can serve as a catalyst in identity politics, especially in the context of tourism and social upheaval.<br /><br />
Ultimately, this insightful work prompts readers to rethink persistent and pernicious popular assumptions that tourism invariably brings a loss of agency to local communities or that tourist art is a compromised form of expression. Art as Politics promises to be a favorite with students and scholars of anthropology, sociology, cultural studies, ethnic relations, art, and Asian studies.<br /><br />
35 illus., 15 in color 
</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="a.peperzak"></a>
<h2 class="subHeaderText"><strong>Adriaan Theodoor Peperzak, Ph.D.</strong></h2>
Arthur J. Schmitt Professor, Philosophy Department <br>
<a href="http://www.luc.edu/depts/philosophy/fac/peperz.htm" target="_blank">About Dr. Peperzak</a>
<br /><br />

<h3><em>Aanspraak en Bezinning</em></h3>

<p><strong>Aanspraak en Bezinning: April 2007<br>
(ISBN 978-90-8687-0080-0)</strong></p>

<p><strong>Synopsis</strong><br>
This is a collection of my essays in Dutch about epistemological, ethical, and metaphilosophical topics (such as truth, speaking,desire, friendship,realations between philosophy and theology).</p>

<p>&nbsp;</p>

<h3><em>Thinking. From Solitude to Dialogue and Contemplation</em></h3>

<p><strong>Fordham University Press: 2006<br>
(ISBN 0-8232-2618-2)</strong></p>

<p><strong>Synopsis</strong><br>
The subtitle indicates three stages on the way of a selfcritical manner of thinking.</p>

<p>&nbsp;</p>

<h3><em>Philosophy between Faith and Philosophy</em></h3>

<p><strong> Notre Dame University Press: 2005<br>
(ISBN 0-268-03886-4)</strong></p>

<p><strong>Synopsis</strong><br>
The addresses to Catholic Intellectuals that are collected in this volume shows how the philosophy produced by Christians relates to their faith and theology. This relation is illustrated by analyses of wonderment, gratitude, hope, ontology and apophatic theology.</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="b.rosenwein"></a>
<h2 class="subHeaderText"><strong>Barbara H. Rosenwein, Ph.D.</strong></h2>
History Professor and Chair<br>
<a href="http://www.luc.edu/depts/history/rosenwein/rosenwein.htm" target="_blank">About Dr. Rosenwein</a>
<img src="images/rosenwein_emotionalcommunities.jpg" align="right" hspace="2">
<h3><em> Emotional Communities in the Early Middle Ages</em></h3>

<p><strong> Cornell University Press; publication date: 2006<br>
(ISBN 978-0-8014-4478-4)</strong></p>

<p><strong>Synopsis</strong><br>
This book proposes that people lived (and live) in "emotional communities," each having its own particular norms of emotional valuation and expression.  It takes up in particular some instances from the Early Middle Ages.  Drawing on extensive historical research as well as cognitive and social constructionist theories of the emotions, this book shows that different emotional communities coexisted, that some were dominant at times, and that religious beliefs affected emotional styles even as those styles helped shape religious expression.</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="t.karamanski"></a>
<h2 class="subHeaderText"><strong>Theodore J. Karamanski, Ph.D.</strong></h2>
History Professor<br>
<a href="http://www.luc.edu/depts/history/karaman/karaman.htm" target="_blank">About Dr. Karamanski</a>
<img src="images/karamanski.jpg" align="right" hspace="2">
<h3><em> Rally 'Round the Flag: Chicago and the Civil War</em></h3>

<p><strong>Rowman & Littlefield Publishers, Inc.; publication date: 1993/2006<br>
(ISBN 0-7425-5137-7)</strong></p>

<p><strong>Synopsis</strong><br>
In this narrative history of Chicago during the Civil War, historian Theodore J. Karamanski examines the people and events that formed this critical period in the city's history. Using diaries, letters, and newspapers that survived the Great Fire of 1871, he shows how Chicagoans' opinions evolved from a romaintic and patriotic view of the war to a recognition of the conflict's brutal realities.  Located a safe distance behind the battle lines, the city economy grew feverishly even while its people divided between support and opposition to the Lincoln administration. Originally published in 1991, this revised edition paints a vivid picture of a Midwestern city vigorously involved in the national conflict.</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="s.waller"></a>
<h2 class="subHeaderText"><strong>Spencer Weber Waller, J.D.</strong></h2>
Professor and Director Institute for Consumer Antitrust Studies, School of Law<br>
<a href="http://www.luc.edu/law/faculty/waller.shtml" target="_blank">About Professor Waller</a>

<h3><em>Thurman Arnold: A Biography</em></h3>

<p><strong>NYU Press; publication date: December 2005<br>
(ISBN 0-8147-9392-4)</strong></p>


<p><strong>Synopsis</strong><br>
This first full-length biography traces the life and work of Thurman Arnold (1891-1969) one of the important and interesting figures of 20th Century American law.  Thurman Arnold was one of the few figures of American law to have served in elected state and local politics, as a nationally prominent legal academic at Yale, head of the Antitrust Division and member of the FDR brain trust in the New Deal, federal appellate judge, pro bonno defender of civil liberties in the McCarty era, and founder of Arnold & Porter, one of the quintessential Washington law firms.  Arnold embodied and shaped most of the major facets of 20th century law and helped define what it meant to be a liberal throughout this era.</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="erenberg"></a>
<h2 class="subHeaderText"><strong>Lewis Erenberg, Ph.D.</strong></h2>
Professor, History<br>
<a href="http://www.luc.edu/depts/history/erenberg/erenberg.htm" target="_blank">About Dr. Erenberg</a>

<h3><em>The Greatest Fight of Our Generation: Louis vs. Schmeling</em></h3>

<p><strong>Oxford University Press; publication date: 2005<br>
(ISBN 0195177746)</strong></p>


<p><strong>Synopsis</strong><br>
In 1938 the American heavyweight champion Joe Louis and his German challenger Max Schmeling met in a fight of epic international proportions.  A rematch after Schmeling won the first bout, this fight brought together simmering tensions between the two fighters, Germany and America, whites and blacks, and fascism and democracy.  In an era of depression and international tension, the bout between Louis and Schmeling attracted the attention of the entire world, symbolized the growing battle of African Americans against racism, and forced white Americans to choose between rooting for a white man, who was considered a Nazi, and a black man who carried American national hopes into the ring.</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="c.johnson"></a>
<h2 class="subHeaderText"><strong>Christian A. Johnson, J.D.</strong></h2>
Professor and Faculty Director, Business Law Center<br>
<a href="http://www.luc.edu/law/faculty/johnson.shtml" target="_blank">About Professor Johnson</a>

<h3><em>The Guide to Using and Negotiating OTC Derivatives Documentation</em></h3>

<strong>Institutional Investor Books; publication date: 2005<br>
(ISBN 1-84374-195-4)</strong></p>

<img src="images/c.johnson-otcderivatives.jpg" align="right" hspace="2">
<p><strong>Synopsis</strong><br>
(From the Publisher):  Make sure you completely understand the ISDA Agreements and how to apply them in OTC derivatives transactions.</p>

How does the 2002 Master Agreement differ from earlier Agreements?<br>

What are the key issues in using and negotiating the Agreements?<br>

<p>Everything you need to know about OTC derivatives transactions in one easy guide!</p> 

<p>An accurate, complete and efficient source for information about the salient business, credit and legal issues in OTC derivatives documentation.</p> 

<p>The same practical advice you expect from weekly Learning Curves in one new volume. </p>

<p>This book is your complete guide to
<ul>
  <li>a detailed explanation of how the Commodity Exchange Act affects OTC derivatives</li><br>
   <li>summary of the accounting for derivatives and the effect of FAS 133</li><br>
  <li>collateral issues</li><br>
   <li>events of default and calculation of damages</li><br>
   <li>insolvency and bankruptcy of counterparties</li><br>
  <li>withholding tax considerations</li><br>
  <li>modifying loan documentation to take into account a borrower's use of derivatives</li>
</ul>
  </p>
<p>Includes a reproduction of the ISDA Agreement and selected reading lists at the end of each chapter, providing you with sources for more technical discussions.</p>

<p>Ideal for lawyers and documentation specialists as a quick resource to use during negotiations and for those wanting to understand the basic issues in OTC derivatives documentation.</p> 

<p>From the Editors of Derivatives Week and Institutional Investor Books.</p>


<h3><em>A Practical Guide to Using Repo Master Agreements</em></h3>
<img src="images/c.johnson-repomaster.jpg" align="right" hspace="2">
<p>co-authored with Paul C. Harding<br>
<strong>Euromoney Books; publication date: 2004<br>
(ISBN 1-84374-120-2)</strong></p>

<p><strong>Synopsis</strong><br>
(From the Publisher): Your complete, line-by-line guide to the TBMA/ISMA Global Master Repo Agreement, the US Master Repo Agreement and the European Master Agreements.</p>

<p>This book also provides you with a detailed examination of
<ul>
  <li>the rapid expansion of the repo market,</li><br>
  <li>triparty repos and other products, and</li><br>
   <li>a review of legal issues.</li>
</ul>
</p>

<p>Includes reproductions of all the relevant documents.</p>

<p>For both seasoned practitioners and newcomers to the market.</p>

<p>"Using Repo Master Agreements is the preeminent reference guide for lawyers and others who must navigate through the complexities of understanding and documenting repos and related custodial agreements." - Future & Derivatives Law Report, May 2005</p> 

<p>"There's more to repo master agreements than meets the eye.  Paul Harding and Christian Johnson provide an illuminating guide to the legal and practical issues that concern both front office and negotiators. The book is invaluable to those who are new to this field, and a fresh look at these well-established master agreements is a good idea for anyone in the industry." - Kurt Crommelin, Head of Legal, Bayerische Hypo- und Vereinsbank AG, London</p>

<p>"The combination of an overview of the market and legal issues, coupled with the detailed analysis of the major market agreements and commonly negotiated provisions, will provide a valuable training guide and reference book in an area where negotiation and complexity is increasing. The review of the core general and margin provisions of the EMA, which apply to all their product annexes, will also prove of wider use to derivative and securities lending negotiators."  Keith Spiller, Executive Director -Traded Products Legal, UBS Investment Bank</p>


<h3><em>Mastering Collateral Management and Documentation: A Practical Guide for Negotiators</em></h3>
<img src="images/c.johnson-masteringcollateral.jpg" align="right" hspace="2">
<p>co-authored with Paul C. Harding<br>
<strong>Financial Times/Prentice Hall; publication date: 2002<br>
(ISBN 0-273-65924-3)</strong></p>


<p><strong>Synopsis</strong><br>
(From the Publisher): "In response to the continuing and growing use of collateral by banks and other financial institutions, this is the first comprehensive book on the subject. This practical guide provides negotiators with a clear, concise explanation of the topic, from an operational perspective and with particular focus on the five ISDA Credit Support Documents. Collateral is now big business. In January 2001 the International Swaps and Derivatives Association, Inc. (ISDA) calculated that between US$175-200 billion was pledged as collateral to protect credit exposure in the derivatives market. The authors estimate that 20-25% of interest rate and currency swap trades are now covered by collateral. This book describes collateral documentation in jargon-free, concise terms making it the must have book for all junior and experienced negotiators in this field."
</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>


<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="bosco"></a>
<h2 class="subHeaderText"><strong>Dr. Mark G. Bosco, S.J.</strong></h2>
Professor, English and Theology<br>
<a href="http://www.luc.edu/depts/english/faculty/bosco.htm" target="_blank">About Dr. Bosco</a>

<h3><em>Graham Greene's Catholic Imagination</em></h3>

<p><strong>Oxford University Press; publication date: 2005<br>
(ISBN 0195177150)</strong></p>


<p><strong>Synopsis</strong><br>
Much has been written about Graham Greene's relationnship to his Catholic faith and its privileged place within his texts.  His early books are usually described as "Catholic Novels"--understood as a genre that not only uses Catholic belief to frame the issues of modernity, but offers Catholicism's vision and doctrine as a remedy to the present crisis in Western civilization.  Greene's later work, by contrast, is generally regarded as falling into political and detective genres.  Bosco argues that this is a false dichotomy created by a narrowly prescriptive understanding of the Catholic genre and obscures the impact of Greene's developing religious imagination on his literary art.  Bosco frames his investigation of Greene's life and work in terms of theological developments in Catholic discourse before and after Vatican Council II and the changes it ushered in.  He shows that these developments continued to engage Greene, and argues how his experience of post-Vatican II Catholicism is embodied in his late works.
</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="ogorman"></a>
<h2 class="subHeaderText"><strong>Robert T. O'Gorman, Ph.D.</strong></h2>
Professor, Institute of Pastoral Studies<br>

<img src="images/ogorman1.jpg" alt="The Complete Idiot's Guide to UNDERSTANDING CATHOLICISM" border="0" align="right">

<h3><em>The Complete Idiot's Guide to UNDERSTANDING CATHOLICISM</em></h3>

<p><strong>Macmillan: Alpha Books; publication date: 2003<br>
(ISBN I-59257-085-2)</strong></p>


<p><strong>Synopsis</strong><br>
This is the second edition of this popular book on Catholicism that has sold more than 200,000 copies.  It is much more than a reference book.  It is the story of Catholicism from the inside.</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="twadell"></a>
<h2 class="subHeaderText"><strong>Phyllis Ann Solari-Twadell, Ph.D.</strong></h2>
Assistant Professor, director of Center for Spiritual Leadership in Health Care<br>
<a href="http://www.luc.edu/schools/nursing/faculty/psolari.html" target="_blank">About Dr. Twadell</a>

<img src="images/twadell1.jpg" alt="Parish Nursing" border="0" align="right">

<h3><em> Parish Nursing: Development, Education and Administration</em></h3>

<p><strong>Elsevier/Mosby, to be released in Sept. 2005; publication date: 2006<br>
(ISBN 0-323-03400-4)</strong></p>


<p><strong>Synopsis</strong><br>
Mar Ann McDermott Faculty Emeritus from the School of Nursing is the Co-Editor. Thsi is our third book that we have done together on parish nusing. This book presents the atate of the art of the ministry of parish nursing practice in the areas of development, education and administration. 
</p>

<p>For more information, <a href="http://www.luc.edu/ywn/facultyauthors/images/parishnursing.pdf" target="_blank">click here</a>.</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="caldwell"></a>
<h2 class="subHeaderText"><strong>Laura Caldwell, J.D.</strong></h2>
Adjunct Professor, School of Law and Alumna<br>
<a href="http://www.luc.edu/law/faculty/parttime/caldwell.shtml" target="_blank">About Professor Caldwell</a>

<img src="images/caldwell2.jpg" alt="Look Closely" border="0" align="right">

<h3><em>Look Closely</em></h3>

<p><strong>MIRA Books, June 2005<br>
(ISBN 0778321835)</strong></p>


<p><strong>Synopsis</strong><br>
A young Manhattan attorney gets an anonymous letter in the mail that says, "There's no statute of limitations on murder.  Look closely."  The letter sends her on a search to Chicago and around the US to find the letter's author and who killed her mother.
</p>

<img src="images/caldwell1.jpg" alt="The Year of Living Famously" border="0" align="right">

<h3><em>The Year of Living Famously</em></h3>

<p><strong>Red Dress Ink, November 2004<br>
(ISBN 0373250754)</strong></p>


<p><strong>Synopsis</strong><br>
A New York fashion designer meets and marries an Irish actor who becomes famous overnight.
</p>

<p>For scheduled book signing and appearances, <a href="http://www.lauracaldwell.com/" target="_blank">click here</a>.</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

<br>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />
<a name="nurses"></a>
<h2 class="subHeaderText"><strong>Carolyn Hope Smeltzer, Frances R. Vlasses, Connie R. Robinson</strong></h2>
School of Nursing Professors and Alumnae

<img src="images/nurseparade.jpg" alt="Images of America: Chicago's Nurse Parade" border="0" align="right">

<h3><em>Images of America: Chicago's Nurse Parade</em></h3>

<p><strong>Arcadia Publishing, February 2005<br>
(ISBN 073853367X)</strong></p>


<p><strong>Synopsis</strong><br>
Chicago singularly honored nurses, our "Angels of Mercy," for a decade (1949-1958). Father Clarence M. Brissette O.S.M., 
director of the Sorrowful Mother Novena, originated both Chicago's "Nurses Day" and Chicago's Nurse Parade in 1949. The purpose 
of the parade was twofold: to give the nurses a "day of glory" and to also encourage others to join this undermanned, noble, 
and caring profession. The first Chicago Nurse Parade (1949) had two floats, four bands, and included many nurses marching in 
capes. The 10-year anniversary parade (1958) had 4,000 marching uniformed nurses, over 30 bands, and over 100 decorated floats 
representing nearly all Chicagoland hospitals and schools of nursing. In 1958, over 100,000 spectators lined Jackson Boulevard 
to honor nurses in what would be the final parade.</p>

<p>Visit our online university calendar for Book Signing event scheduled for March 15, 2005.</p>

<p>&#160</p>
<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>
<br>

<hr style="border:none; height:1px; border-top:1px solid #cccccc;" />

<a name="lavelle"></a>
<h2 class="subHeaderText"><strong>Brian Lavelle, Ph.D.</strong></h2>
Classical Studies Professor

<img src="images/Lavelle.png" alt="Lavelle" border="0" align="right">

<h3><em>Fame, Money, and Power:</em> The Rise of Peisistrators and Democratic Tyranny at Athens</h3>

<p><strong>University of Michigan Press, 2005<br>
(ISBN 0-472-11424-7)</strong></p>


<p><strong>Synopsis</strong><br>
The Athenian "golden age" occurred in the fifth century B.C.E. and was attributed to their great achievements in art, 
literature, science, and philosophy. However, the most important achievement of the time was the political movement from 
tyranny to democracy. Though tyranny is thought to be democracy's opposite and deadly enemy, that is not always the case. In 
Fame, Money, and Power, Brian Lavelle states that the perceived polarity between tyranny and democracy does not reflect the 
truth in this instance.</p>

<p>The career of the tyrant Peisistratos resembles the careers and successes of early democratic soldier-politicians. As with 
any democratic political system, Peisistratos' governance depended upon the willingness of the Athenians who conceded 
governance to him. This book attempts to show how the rise of Peisistratos fits into an essentially democratic system already 
entrenched at Athens in the earlier sixth century B.C.E. </p>

<p>Emerging from the apparent backwater of eastern Attika, Peisistratos led the Athenians to victory over their neighbors, the 
Megarians, in a long, drawn out war. That victory earned him great popularity from the Athenians and propelled him along the 
road to monarchy. Yet, political success at Athens, even as Solon implies in his poems, depended upon the enrichment of the 
Athenian demos, not just fame and popularity. Peisistratos tried and failed two times to "root" his tyranny, his failures owing 
to a lack of sufficient money with which to appease the demos. Exiled from Athens, he spent the next ten years amassing money 
to enrich the Athenians and power to overcome his enemies. He then sustained his rule by grasping the realities of Athenian 
politics. Peisistratos' tyrannies were partnerships with the demos, the first two of which failed. His final formula for 
success, securing more money than his opponents possessed and then more resources for enriching the demos, provided the model 
for future democratic politicians of Athens who wanted to obtain and keep power in fifth-century Athens.</p>


<p>&nbsp;</p>

<div align="right">
<a href="#top"><img src="../../../display/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>
</div>

</div></div>
</td></tr>
</table>

</div>

</div></div>
<cfinclude template="/newsevents/public/ssi/footer_61807.cfm">