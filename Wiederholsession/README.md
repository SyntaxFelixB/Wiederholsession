#Wiederholsession zur folgenden Themen:
- Listen
- Tab Views
- Navigation Stack?
- MVVM
- Core Data


##Vorwort:
Wir stellen uns vor wir Arbeiten für einen Kunden und dieser gibt uns grob seine Vorgaben vor. 
Das heißt wir haben keine richtige Liste die wir abarbeiten können, wir müssen uns also selbst einen Plan machen, wie wir seine Wünsche in eine App umsetzen können.
Wenn wir Vorgaben bekommen ist es gut auf "Keywords" zu achten bei den Anforderungen, diese können uns schon eine grobe Richtung geben was wir brauchen um die App umzusetzen.
Im folgenden Beispiel würde ich einem meine (Felix) herangehensweise zeigen, um eine gewünsche Funktionalität umzusetzen. 
Hierbei werde ich aber auch davon ausgehen, dass ich nicht alles im Kopf habe, also werde ich auch genau zeigen was ich suche damit ich die Vorgaben einhalten kann.


##Kundenwunsch:
Frau Bierbacher möchte gerne eine App erstellen, die für sie als Einkaufshilfe agiert. 
Sie möchte gerne, dass sie Artikel zu einer Liste von Artikeln hinzufügen kann, so gesehen also eine Sammlung von allen möglichen Artikeln erstellen kann. Aus dieser Liste von Artikeln möchte sie nun mit einem Knopfdruck Artikel auswählen, welche sie zu ihrer Einkaufsliste hinzufügt. Beide Listen sollten jederzeit irgendwie einsehbar sein.
Wenn sie einen Artikel eingepackt hat, möchte sie diesen gerne wieder von der Einkaufsliste löschen können. Weiterhin vergisst sie das Löschen gerne mal bei den letzten paar Artikeln uns wünscht sich somit auch einen Knopf um alle Artikel aus der Einkaufsliste zu löschen, spricht die Liste zu leeren.
Zudem wünscht sie sich, wenn sie auf einen der Artikel in der gesamtartikel Liste klickt, dass sich dadurch ein Bereich öffnet, wo sie Notizen zu diesem Artikel hinzufügen kann, damit sie zum Beispiel dort verschiedene Rezepte angeben kann, wofür dieser Artikel verwendet werden könnte.
Das Alles soll natürlich gespeichert werden, damit die gesammelten Artikel bei jedem Appstart wieder da sind, sonst müsste sie jedes mal alle Artikel wieder neu eintippen.
Sie hat keine Vorgaben gemacht, wie die App aussehen soll, ihr geht es erstmal rein um die Funktionalität.

##Kundenwunsch Analyse
So nun haben wir die grobe Beschreibung zu der gewünschten App, jetzt geht es darum zu analysieren, was wir alles brauchen könnten.
Dafür würde ich die Vorgabe auf bestimmte Schlagwörter untersuchen. Wir können ja mal Stück für Stück durchgehen, was ich erkennen würde.

-----------------------------------------------------------------------------------------
| Frau Bierbacher möchte gerne eine App erstellen, die für sie als Einkaufshilfe agiert.|
-----------------------------------------------------------------------------------------
Dies ist ein Satz der mir nicht viel hilft, ich sehe in also nur als grobe Einleitung.

-----------------------------------------------------------------------------------------
| Sie möchte gerne, dass sie Artikel zu einer Liste von Artikeln hinzufügen kann,       |
| so gesehen also eine Sammlung von allen möglichen Artikeln erstellen kann.            |
-----------------------------------------------------------------------------------------
Hier gibt es einige Infos, die uns sagen, was wir brauchen können.
Zum einen wir hier schon explizit gesagt, dass Frau Bierbacher sich eine Liste von Artikeln wünscht, also denke ich mir wir brauchen an sich eine Listenansicht von Einträgen.
Weiterhin möchte sie neue Artikel zu dieser Liste hinzufügen können, dadurch kann man davon ausgehen, das wir es hier mit veränderbaren Daten zu tun haben, wenn dies der Fall ist würde ich schon mal ein MVVM Pattern im Kopf haben, damit wir "Live data" dieser Liste unterstützen können.
Also nur durch diesen Satz wissen wir, wir brauchen auf jedenfall eine Listenansicht und Livedata für diese Liste und für Livedata bietet sich das MVVM pattern an.

-----------------------------------------------------------------------------------------
| Aus dieser Liste von Artikeln möchte sie nun mit einem Knopfdruck Artikel auswählen,  |
| welche sie zu ihrer Einkaufsliste hinzufügt.                                          |
-----------------------------------------------------------------------------------------
Hierbei bekommen wir nun die Info, das wir den einzelnen Einträgen der Liste, eine Funktionalität zuweisen müssen, um diese in eine andere Liste zwischen zu speichern.

-----------------------------------------------------------------------------------------
| Beide Listen sollten jederzeit irgendwie einsehbar sein.                              |
-----------------------------------------------------------------------------------------
Kurzer Satz, jedoch auch hier können wir etwas herrausnehmen.
Da beide Listen einsehbar sein sollen, müssen wir also eine Möglichkeit haben beide anzeigen zu lassen.
Da könnte man jetzt eine Googlesuche zu starten, was für Möglichkeiten es da gibt. 
Eine wäre zum Beispiel eine Tab view einzubauen, damit könnte man einfach hin und her zwischen Beiden Listen wechseln und sie somit jederzeit einsehen.

-----------------------------------------------------------------------------------------
| Wenn sie einen Artikel eingepackt hat, möchte sie diesen gerne wieder von der         |
| Einkaufsliste löschen können. Weiterhin vergisst sie das Löschen gerne mal bei den    |
| letzten paar Artikeln uns wünscht sich somit auch einen Knopf um alle Artikel aus der |
| Einkaufsliste zu löschen, spricht die Liste zu leeren.                                |
-----------------------------------------------------------------------------------------
Die beiden Sätze tuen wir einfach mal zusammen, da die Infos die wir bekommen sehr ähnlich sind.
Wir brauchen also für unsere zweite Liste die Möglichkeit Einträge zu löschen, glücklicherweise wird swipe to delete für uns übernommen in Swift und wir müssen uns nur um den extra Button kümmern, wir müssen also eine Funktion implementieren, welche die Liste eimal leert.

-----------------------------------------------------------------------------------------
| Zudem wünscht sie sich, wenn sie auf einen der Artikel in der gesamtartikel Liste     |
| klickt, dass sich dadurch ein Bereich öffnet, wo sie Notizen zu diesem Artikel        |
| hinzufügen kann, damit sie zum Beispiel dort verschiedene Rezepte angeben kann,       |
| wofür dieser Artikel verwendet werden könnte.                                         |
-----------------------------------------------------------------------------------------
Der letzte Part, wofür Frau Bierbacher die Funktion braucht ist uns erstmal egal, wir wissen aber nun, das wir eine Detailview einbauen müssen, auf die wir gelangen wenn wir auf ein Listenelement klicken.
Desweiteren, wissen wir das unser Model für die Listeneinträge ein extra Bereich braucht, in dem wir die Notiz speichern können. 

-----------------------------------------------------------------------------------------
| Das Alles soll natürlich gespeichert werden, damit die gesammelten Artikel bei jedem  |
| Appstart wieder da sind, sonst müsste sie jedes mal alle Artikel wieder neu eintippen.|
-----------------------------------------------------------------------------------------
Hier bekommen wir nun die Info, dass wir unsere Daten in Core Data speichern müssen, dadurch müssen wir noch einmal unseren ersten Ansatz überdenken, wie wir die beiden Listen strukturieren. Zunächst haben wir uns ja überlegt 2 Listen anzulegen, eine für die "Stammdaten" und eine für die Einkaufsliste.
Nun da wir aber mit Core Data arbeiten, würde sich es anbieten, in der Artikelliste einen Parameter zu setzen, dass dieser Artikel in der Einkaufsliste ist. Damit können wir nicht nur die "Stammdaten", sondern auch die Einkaufsliste speichern. Dazu müssen wir nun aber auch einen "Filter" bauen für unsere Einkaufsliste, das alle Artikel angezeigt werden, welche den Parameter gesetzt haben. Diesen Filter haben wir auch schon mal gehabt, mit Predicates! Des Weiteren müssen wir nun auch darauf achten, das swipe to delete vielleicht nicht ganz das mach was wir wollen, wir müssen also entweder die Funktionalität davon ändern, oder einen Button einbauen um Artikel aus der Einkaufsliste wieder zu entfernen, was mit unserem neuen Ansatz ja nur noch ein Toggle einer Variable ist.

-----------------------------------------------------------------------------------------
| Sie hat keine Vorgaben gemacht, wie die App aussehen soll, ihr geht es erstmal        |
| rein um die Funktionalität.                                                           |
-----------------------------------------------------------------------------------------
An sich keine Wichtigen Infos.


##Zusammenfassung Anforderungen:
Nun da wir die Anforderungen einmal durchgegangen sind, fassen wir einmal zusammen was wir so haben:
- Tabview um die "Stammdaten" und die Einkaufsliste einsehen zu können.
- View zum hinzufügen von Artikeln.
- Button zum leeren der Einkaufsliste in der Tabview davon.
- MVVM Pattern um Livedata unserer "Stammdaten" und Einkaufsliste anzuzeigen.
- Detailview um Notizen zu machen.
- Ein Datenmodell für die "Stammdaten".
- Listeneinträge müssen klickbar sein um die Detailview zu öffnen und in der "Stammdaten" View einen Button haben, um sie der Einkaufsliste hinzuzufügen.
- Button oder Anpassung des swipe to delete in der Einkaufsliste um Artikel von dieser zu löschen, jedoch nicht von den "Stammdaten".

Damit haben wir an sich auch schon alles um eine App zu bauen!

##Projektstruktur:
Jetzt kommt vielleicht die Frage auf, wo fang ich denn am besten an?

Dazu kann ich sagen, am besten bei der Planung der Projektstruktur! :D
Damit meine ich, wenn wir in einem Projekt arbeiten, vor allem mit anderen, wollen wir Sachen sortieren um sie schneller zu finden. 
Überlegen wir uns einmal was für Datein wir erstellen werden:
- View für die Tabview
- View für die Detailview
- View für das hinzufügen von Artikeln
- View für "Stammdaten" Listeneintrag
- View für Einkaufsliste Listeneintrag
- View für "Stammdaten" Liste
- View für Einkaufsliste Liste
- Model für unsere Listeneinträge (In Core Data)
- Viewmodel für unsere Livedata

Das sollte soweit erstmal alles sein, fällt vielleicht schon was auf?
Wir haben viele Views und ein paar Sachen die keine Views sind. In der Regel spricht man hier von UI und Daten. Wir können also unser Projekt in 2 Ordner unterteilen, einmal Views und einmal Data.
Da wir hier aber mit Core Data arbeiten, müssen wir unser Model in unserer "Lokalen Datenbank" anlegen.
Was ist aber der Sinn bei so einem kleinen Projekt? Übung! In späteren Projekten in der Arbeitswelt wird sehr viel organisiert, man könnte z.B. auch noch Unterordner für eine Unterteilung von den bestimmten Views machen, sprich Stammdaten und Einkaufsliste. Klingt erstmal nach unnötig viel Arbeit, jedoch kann man gut strukturierte Projekte sehr gut wie ein Lexikon nachschlagen. Eine gute Struktur von großen Projekten spart sehr viel Zeit und Nerven auf lange Sicht!


##Reihenfolge:
Ok nun haben wir unsere Projektstruktur, wir wissen auch was für Datein wir anlegen werden, und wir wissen auch an sich schon was wir wohin implementieren müssen, eigentlich alles beisammen um durchzustarten.
Aber nun kommt die Frage, was sollten wir zuerst konkret implementieren?
Dazu würde ich mir immer die Frage stellen, "was wird am meisten irgendwo anders gebraucht?" oder "Was hat am wenigsten bis zu garkeinen Abhängigkeiten?".
Wenn wir nun einmal alle Bereiche durchgehen, könnte man einfach zum Entschluss kommen, dass das Modell als erstes implementiert werden sollte. Das Model hat keine Abhängigkeiten und wird für viele Views gebraucht.
Danach wohlmöglich das Viewmodel, da die Abhängigkeit zum Model erfüllt ist, und eine Vorraussetzung für die Views sein wird.
Danach wohlmöglich die Einzelnen Listeintrag Views, da diese auch mit dem Model alleine ihre Abhängigkeiten gedeckt haben sollten und Vorraussetzung für die richtigen Listen sind.
Dann kommen wir zu den eigentlichen Listen, welche als Vorraussetzung das Viewmodel und die Listeneinträge hat.
Zum Schluss dann die Tabview, welche beide Listen vereint.

Wenn man also sich Gedanken macht, was wird wo vorrausgesetzt und was wird wo gebraucht, dann ergibt sich die Reihenfolge von selbst :D


##Model:
Auch unser Datenmodel können wir einmal im Vorfeld planen. 
Wir wissen durch alles was wir bis hierhin gemacht haben, das wir zumindest folgende Daten brauchen:
- Id: UUID
- Artikelname: String
- Notiz: String
- InEinkaufsListe: Boolean
- (Optional) Bild: String

Diese Felder können wir in unserer Core Data einmal anlegen. Dazu müssen wir, einmal auf unsere Projektgruppe rechtsklicken, und eine neue File erstellen. Hierbei können wir dann unter "Core data" den Eintrag "Data model" finden, diesen erstellen wir.
Nennen können wir die File so wie wir wollen, es würde sich jedoch natürlich anbieten, selbstbeschreibende Namen zu nehmen, in meinem Beispiel heißt es "Wiederholsession". Ist dies ein gut gewählter Name? Nein, denn er sagt einem nicht direkt was es ist und worum es geht. Wenn wir wieder an unser Lexikon denken, dann macht es nicht viel Sinn, eine "Datenbank" in der Artikel gespeichert sind, "Wiederholsession" zu nennen. Was würde sich also hier anbieten? Vieles! Darunter z.B. ArtikelModel, ArtikelDatabase, Articles, Database usw. wobei alles was schon ziemlich spezifisch sagt, was denn dort drinnen ist, bevorzugt wird. Dann sehen wir auf anhieb was drinnen ist, ohne reinschauen zu müssen.


##Viewmodel:
Als nächstes können wir uns um das Viewmodel kümmern, dies ist wohl mit die Datei, welche am meisten Zeilen beinhaltet. Aber keine Sorge, vieles ist copy paste und wiederholt sich oft, (Vielleicht kann der eine oder andere ja herausfinden, wie man hier einige Zeilen an Code sparen kann, Tipp: "Auslagern", damit man nicht so viel copy pasten muss :D)
Aber bevor wir nun anfangen zu schreiben, machen wir uns einmal gedanken, was hier überhaupt rein soll:
- Eine published list für die Artikel selber
- Eine published list für die Einkaufsliste

- Eine Funktion alle Artikel aus der Datenbank auszulesen
- Eine Funktion alle Artikel auf der Einkaufsliste auszulesen

- Eine Funktion neue Artikel zu speichern

- Eine Funktion einen Artikel zur Einkaufsliste hinzuzufügen
- Eine Funktion um Artikel von dieser zu entfernen
- Eine Funktion alle Artikel von der Einkaufsliste zu entfernen
- Eine Funktion notes von Artikeln upzudaten.

Diese Anordnung ist bewusst gewählt, warum?
Oben sind einmal die beiden Listen die wir brauchen, daunter Funktionen für diese Listen, vielleicht erkennt man hier das CRUD prinzip hinter. Die ersten 2 sind R-Funktionen, sie lesen nur aus der "Datenbank" aus, die danach ist eine C-Funktion, sie erstellt neue Einträge in der "Datenbank".
Wie sieht es aber nun mit den letzten 4 aus? Sind das U- oder D-Funktionen?
Auch wenn es vielleicht durch das Wort "Entfernen" etwas verwirrend erscheint, sind diese Funktionen in unserem Projekt reine U-Funktionen, da sie nur Einträge updaten.
Das würde bedeuten, das wir keine Delete Funktion in unserem Projekt hätten, vollkommen richtig, der Kundenwunsch hat nicht explizit vorgesehen, dass dies Implementiert wird. Man könnte nun natürlich einmal nachfragen, ob dies denn so gewünscht ist und ob man vielleicht diese Funktion mit einbauen sollte, jedoch lassen wir diese für unser Projekt erstmal weg.

Wenn wir unsere File nun erstellen müssen wir einmal daran denken, das wir die Klasse die wir erstellen werden erben lassen von ObserveableObject, damit wir "Live data" nutzen können.
Als erstes sollten wir nun unseren container erstellen, dieser wird unser Zugang zur "Datenbank". NSPersistentContainer ist hierbei die Klasse von der wir ein Objekt erstellen müssen, damit wir einen container haben, mit dem wir arbeiten können (Ein Objekt einer Klasse wird meist so erstellt, das man den Namen der Klasse gefolgt von diesen () Klammern nutzt, einige Klassen erwarten Parameter bei der Objekterstellung, der persistentcontainer zählt zu so einer!).
Danach können wir auch schon unsere 2 Listen definieren, dazu wählen wir uns am besten wieder selbst beschreibende Namen, und geben ihnen den Property Wrapper @Published (Falls hierzu noch Fragen sind, gerne melden, dann würde ich auch nochmal darüber gehen).
Initialisieren, tuen wir sie erstmal als leere Liste (Initialisieren vs. Definieren, Definieren ist sagen es existiert, wir sagen aber noch nicht konkret was es ist. Sprich wenn wir eine Variable definieren, dann geben wir meist einen Variablennamen an und den Typ der Variable, jedoch kommt hier kein = Zeichen, dies würde bedeuten, dass wir konkret sagen was die Variable sein wird, dies wäre dann das Initialisieren!).
Nun könnnen wir schon einmal die Funktionen definieren (Funktionen definieren funktioniert ähnlich, wir können zwar nicht den Typ angeben, jedoch können wir schon mal der Funktion einen Namen geben und den Körper, das sind die {} Klammern, aufstellen)
Wenn wir alle Funktionen aufgeschrieben haben, sollten wir uns gedanken darüber machen, was wir vielleicht für Informationen "Von Außen" brauchen. Damit ist gemeint, das wir z.B. wenn wir ein neuen Artikel erstellen, das wir z.B. den Namen des Artikel brauchen. Dies ist möglich durch Übergabeparameter.
Gehen wir also noch einmal alle Funktionen durch und schauen einmal, was für Parameter als Übergabeparameter Sinn machen.
- Eine Funktion alle Artikel aus der Datenbank auszulesen
- Eine Funktion alle Artikel auf der Einkaufsliste auszulesen
-> Für beide gilt, wir lesen nur Daten aus unserer "Datenbank", also unserem container aus. D.h. aber auch, das wir keine Informationen von außen benötigen, also folgt diese Funktionen haben keine Übergabeparameter.

- Eine Funktion neue Artikel zu speichern
-> Um einen neuen Artikel speichern zu können, müssen wir wissen wie dieser Artikel denn heißen soll. D.h. hier bietet es sich an, ein Übergabeparameter von außen zu bekommen, welcher den Namen des Artikel beinhaltet. Sprich die Funktion könnte so aussehen "func addNewArticle(articleName: String) {}"

- Eine Funktion einen Artikel zur Einkaufsliste hinzuzufügen
- Eine Funktion um Artikel von dieser zu entfernen
-> Da wir hier wissen müssen, welchen Artikel wir denn hinzufügen, bzw. entfernen, wäre es natürlich gut, wenn wir diese Info von außen bekommen. Hier bietet sich es an direkt den ganzen Artikel mitzuliefern.
Eine der beiden Funktionen könnte somit vielleicht so aussehen "func addToShopping(article: Artikel) {}".
Dabei ist zu beachten, dass "Artikel" hierbei unser Datenmodell, welches wir in der "Datenbank" definiert haben ist.
- Eine Funktion alle Artikel von der Einkaufsliste zu entfernen
-> Da wir alles löschen, müssen wir nicht wissen was wir löschen, also brauchen wir hier keinen Übergabeparameter.
- Eine Funktion notes von Artikeln upzudaten.
-> Ähnlich wie das hinzufügen und entfernen von der Einkaufsliste brauchen wir hier wieder die Info, welcher Artikel angepasst werden soll. D.h. wir brauchen wieder den Artikel als Übergabeparameter. Aber wir brauchen diesmal noch mehr, wir brauchen auch die Info welche note denn nun gespeichert werden soll, also müssen wir auch noch die note mitgeben!
Die Funktion könnte also so aussehen "func updateNote(note: String, article: Artikel) {}"

Damit haben wir alle Funktionen soweit definiert, wirklich viel machen sie aber noch nicht.

Fangen wir also mit den R-Funktionen an, speziell mit der Methode, welche alle Artikel fetched. Bei diesen gilt immer, wir erstellen zunächst einen request, welchen wir gegen unsere "Datenbank" laufen lassen wollen, sehr analog zu SQL in Kotlin.
Diese requests bauen wir mit der Klasse NSFetchRequest, wie genau ein Request aufgebaut ist, könnte man jetzt googlen, ChatGPT fragen oder auch einfach in den alten Aufgaben nachschlagen.
In unserem Fall könnte der request etwas so aussehen "NSFetchRequest<Artikel>(entityName: "Artikel")".
Artikel bezieht sich hier wieder auf unser Model in unserer "Datenbank".
Aber was genau "holt" uns dieser request denn jetzt? So wie er jetzt aufgestellt ist, dient dieser Request alle Einträge zu bekommen, welche wir gespeichert haben, also ist dieser schon mal sehr gut um die Liste aller Artikel zu bilden.
Was wir also als nächstes machen ist, das wir unsere Liste befüllen mit dem Ergebnis des requests.
Wenn wir unsere Liste komplett neu befüllen wollen, reicht es wenn wir sie einfach = setzen mit dem, was rein soll. Um dazu den request gegen unsere "Datenbank" laufen zu lassen, müssen wir einmal über unseren container, welcher wie wir oben schon einmal besprochen haben, unser Zugriffsort zu dieser ist, auf seinen context zugreifen, um dort die fetch methode aufzurufen.
Das alles sollte dann in etwa so aussehen "articleList = container.viewContext.fetch(request)".
Jetzt wird uns hier aber ein Fehler angezeigt! Das liegt daran, das die Funktion so geschrieben ist, dass sie einen Fehler "werfen" kann. In manchen Fällen ist es gut, wenn wir Funktionen so schreiben, dass wir schon vorher wissen sobald Fehler auftreten können. Wenn wir so eine Funktion nun haben, müssen wir mit diesem "werfbaren" Fehler umgehen. Wie man damit umgeht hatten wir auch schon mal. Die gesuchten Schlüsselworte sind hier "do-try-catch", also im Endeffekt auf gut deutsch gesagt:
Wir wollen eine Funktion aufrufen, welche einen Fehler werfen kann (do). 
Zunächst versuchen wir die Funktion aufzurufen (try) und wollen im Falle dessen, das die Funktion ihren Fehler wirft, diesen auffangen und behandeln (catch).
Würden wir diesen Fehler nicht behandeln, würde unsere App jedes mal abstürzen, falls der Fehler der Funktion auftritt. "do-try-catch" ist also dafür da, Fehler welche bekannt sind, welche auftreten können im Vorfeld anzukündigen, um diese im Vorfeld zu behandeln, damit die App auch im Falle des Fehlers ohne Probleme weiter laufen kann.
Der gesamt block könnte dann also wie folgt aussehen:

do {
    articleList = try container.viewContext.fetch(request)
} catch {
    print("Loading failed: \(error)")
}

Wir haben also um unseren fetch request ein "do-try-catch" drumherum gebaut. Hierbei ist das "print("Loading failed: \(error)")" an sich nicht nötig. Dies dient nur dazu, sollte ein Fehler beim Versuch die Funktion aufzurufen auftreten, Feedback zu bekommen.
Dieser Block von Code wird sehr ähnlich in fast alles Funktionen in der ViewModel Klasse benutzt.
Damit haben wir auch schon unsere fetchArticle Funktion fertig.
Die Funktion die Einkaufsliste zu befüllen ist sehr analog gemacht, dafür können wir einmal die komplette Funktion kopieren und in die Funktion einfügen, welche dafür da ist, die Einkaufsliste zu laden.
Nun würde die Einkaufslisten fetch Funktion aber das gleiche machen wie die Artikel Funktion. Das ändern wir, in dem wir zunächst einmal die zu überschreibende Liste auf die Einkaufsliste ändern.
Danach müssen wir noch einen "Filter" einbauen. Die geschied mit NSPredicate!

Alles Weitere folgt ist in der Wiederholung, sollte es gewünscht sein, alles textuell aufzuschreiben, gerne eine Nachricht und bescheid sagen, dann mach ich den Rest noch fertig.
