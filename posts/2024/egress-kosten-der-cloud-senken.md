---
date: 2024-02-19
categories: [Cloud]
lang: de
title: "Egress-Kosten der Cloud senken"
image: clouds.webp
---

![](clouds.webp)

**Neben den Hosting-Kosten sind beim Bereitstellen von Dateien in der Cloud die sogenannten Egress-Kosten ein wichtiger Aspekt. Um was für Kosten es sich dabei handelt und wie man diese potenziell senken kann, das möchte ich gerne in diesem Blogpost aufzeigen.**

Ich traf kürzlich in einem Projekt auf die Fragestellung, ob das vorgesehene Budget für die Nutzung von [Amazon S3](https://aws.amazon.com/de/s3/) für die Bereitstellung umfangreicher Dateien ausreicht. Diese Problemstellung war eng verbunden mit der Frage, wie man Nutzende dazu bekommen könnte, möglichst keine unnötigen Downloads zu tätigen.

Dies sind spannende Fragestellungen, vor allem wenn es sich bei den Daten um umfangreiche offene Daten oder offene Verwaltungsdaten (Open Data bzw. Open Government Data) handelt, die grundsätzlich ohne Einschränkungen der Öffentlichkeit zur Verfügung gestellt werden sollen. Denn in diesem Umfeld fällt die Möglichkeit ausser Betracht, den Zugriff auf die Daten materiell irgendwie einzuschränken (beispielsweise, indem man einen Login erfordert oder Ähnliches).

Bevor wir uns damit befassen, sollten wir aber zuerst ein paar grundlegende Begriffe klären.

## Egress vs. Ingress?

Wenn man Dateien in der Cloud speichert, berechnen sich die Kosten üblicherweise gemäss der Nutzung. Doch was heisst «Nutzung» im Cloud-Kontext überhaupt? Weshalb gibt es die Unterscheidung zwischen Ingress, Hosting und Egress? Und was bedeuten diese Begriffe überhaupt?

«Nutzung» kann für die Cloud tatsächlich unterschiedlich verstanden werden. Gebräuchlich sind die folgenden drei Begriffe, wovon der erste noch der am breitesten verstandene ist (vgl. auch die Abbildung):

* **Hosting**: Prozess der Aufbewahrung von Daten im System: z.B. Aufbewahren einer Datei in der Cloud (kostenpflichtig)
* **Ingress**: Prozess, in dem Daten ins System kommen (meist kostenlos): z.B. ein Upload einer Datei in die Cloud
* **Egress**: Prozess, in dem aus dem System fliessen (meist kostenpflichtig): z.B. ein Download einer Datei aus der Cloud

![Mögliche Kosten der Cloud-Nutzung: Von Ingress über Hosting zu Egress](egress-ingress-1.webp)

Cloud-Anbieter verrechnen Egress-Kosten unter anderem häufig, weil ihnen selbst durch Egress effektiv Kosten entstehen: Sie müssen die nötige Bandbreite für Downloads zur Verfügung stellen und entsprechende Verbindungen mit Internet-Service-Providern (ISPs) bereithalten. Die Verrechnung von Egress-Kosten dient auch dazu, die Nutzung der Dienste der Cloud-Anbieter zu steuern und zum Beispiel nicht regelmässig grosse Datenmengen über das öffentliche Internet zu verschieben.

## Kostenvergleich

Zufälligerweise bin ich vor einigen Tagen über einen Artikel gestossen, der die [Egress-Kosten von verschiedenen Cloud-Anbietern](https://getdeploying.com/reference/data-egress) vergleicht. Die Unterschiede zwischen den Anbietern sind enorm. Wenn man die grossen Player im Markt vergleicht, gibt es eine Gemeinsamkeit: die Egress-Kosten sind in der Regel so ausgelegt, dass Kundinnen und Kunden einen grossen Anreiz haben, möglichst viele Teile ihrer Infrastruktur beim gleichen Anbieter zu haben. Ein Beispiel: wenn ich das Backup meiner Dateien in einer anderen Cloud habe als das Hosting, habe ich für jeden Backup-Vorgang Egress-Kosten. Typischerweise sind die Gebühren für Datentransfers innerhalb der gleichen Cloud sehr tief.

Es gibt aber auch Ausreisser: Wer nicht auf zum Beispiel spezifische Funktionen oder andere Aspekte des Angebots einer der grossen Dienstleister angewiesen ist, kann sich aktuell Egress-Kosten komplett sparen, wenn er oder sie beispielweise [Cloudflare R2](https://www.cloudflare.com/developer-platform/r2/) (ein S3-kompatibler Object Storage) einsetzt. Ein Vergleich der Cloudanbieter lohnt sich in jedem Fall, mit möglichst konkreten Zahlen und Anforderungen für den eigenen Anwendungsfall. Je nach Dienst und Region können die Preise stark variieren. Dabei sind auch die häufig vorhandenen [Freigrenzen («free allowance»)](https://getdeploying.com/reference/data-egress) und natürlich mögliche weitere Unterschiede der Angebote zu beachten.

Aber auch unabhängig davon, bei welchem Anbietern man ist, gibt es Möglichkeiten, wie die Egress-Kosten reduziert werden können.

## Nutzende mit guter User Experience führen

Angesichts von Egress-Kosten spart jeder _nicht_ gemachte Download Geld. Hinter dieser Binsenwahrheit steckt mehr als auf den ersten Blick ersichtlich ist: Wer viele und umfangreiche Downloads anbietet, die aus der Cloud kommen, tut gut daran, seine Nutzenden so zu führen, dass sie nur wirklich relevante Downloads auslösen. Gerade Anbieter von offenen Daten (Open Data bzw. OGD) stehen hier vor einem Dilemma: einerseits sollen die offenen Daten einer möglichst breiten Öffentlichkeit zugänglich sein, andererseits soll das Download-Budget (Egress) nicht schon bereits nach wenigen Monaten aufgebraucht sein bzw. die Kosten beliebig steigen.

Nutzende müssen also im Idealfall _vor_ einem Download wissen, welche Daten sie vor sich haben. Es braucht klare Inhaltsangaben (Metadaten), Hinweise über die zeitliche, räumliche und/oder allenfalls thematische Abdeckung, idealerweise verbunden mit einer Vorschau der Daten und möglichen Anwendungsfällen – am besten kombiniert mit Hinweisen zur Grösse der Datei, der voraussichtlichen Download-Dauer und allenfalls Angaben zur [digitalen Suffizienz](https://www.zhaw.ch/de/forschung/forschungsdatenbank/projektdetail/projektid/1389/) (z.B. CO₂-Ausstoss pro Download) und mit der Möglichkeit des Downloads von Testdaten (in Form einer kleinen Stichprobe).

Um das alles zu erreichen, braucht es ein User Interface, das die Nutzenden zielgenau zu den für sie richtigen Daten führt. Umgekehrt müssen die Daten auch so strukturiert vorliegen, wie die Nutzenden diese (am häufigsten) brauchen: Wenn ich Messdaten typischerweise monatlich analysiere, diese aber nur als Gigabyte-grosse Datei über ein ganzes Jahr vorliegen, lade ich immer (für meinen Anwendungsfall) «zu viel» herunter. Dazu ist es unerlässlich mit den eigenen Nutzerinnen und Nutzern zu sprechen, ihre Bedürfnisse zu antizipieren und ihr tatsächliches Verhalten zu analysieren.

## Technische Massnahmen

Neben einem gut gestalteten User Interface und der angenehmen User Experience gibt es auch noch verschiedene technische Massnahmen, die dabei helfen, die Egress-Kosten zu senken:

* **Einsatz eines Content Delivery Networks (CDN)**: Ein CDN ist ein Cache, der räumlich bzw. «internet-topologisch» möglichst nah bei den Nutzenden Daten zur Verfügung stellt. Dadurch können die Kosten für Datentransfers aus der Cloud selbst reduziert werden.
* **Verwendung geeigneter Dateiformate und/oder von Kompression**: Ein passendes Datenformat kann die Dateigrösse stark beeinflussen (zum Beispiel [Parquet anstatt CSV](https://digital.ebp.ch/2024/02/05/death-to-csv-part-ii/)). Alternativ kann die ganz klassische Kompression, beispielsweise mit Zip/BZip/GZip/Brotli, helfen.
* **Monitoring**: Um die eigenen Kosten im Griff zu haben, ist es wichtig, ein geeignetes Monitoring aufzusetzen. So kann man frühzeitig Nutzungsmuster erkennen und bei Bedarf (zum Beispiel bei Serien-Downloads) geeignete Massnahmen ergreifen.
* **Einschränkung des Zugriffs**: Wenn Nutzende die Infrastruktur übermässig beanspruchen, dann ist die Ultima Ratio, den Zugriff zu sperren oder Downloads zumindest zu drosseln (d.h. die Geschwindigkeit von Downloads künstlich zu verringern). Der «Nutzende» kann in diesem Fall beispielsweise ein Skript sein, das zu oft Daten herunterlädt. Zu diesem Zweck ist es hilfreich, entsprechende Bestimmungen in den eigenen Nutzungsbestimmungen zu haben, zum Beispiel eine sogenannte [Fair-Use-Klausel, wie sie beispielsweise das Bundesamt für Landestopografie swisstopo](https://www.swisstopo.admin.ch/de/kostenlose-geodaten-ogd) kennt.


_Hinweis: dieser Blogpost wurde zuerst auf dem EBP-Blog [digital.ebp.ch](https://digital.ebp.ch/2024/02/19/egress-kosten-der-cloud-senken/) publiziert._

Headerbild: [CC-BY](https://creativecommons.org/licenses/by/2.0/) J. Triepke (via Flickr)
