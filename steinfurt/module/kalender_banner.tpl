{* Entfernt alle unn�tigen Leerzeichen und Leerzeilen bis {/strip} *}{strip}

{*
	Name : Kalender 2.0 Template - Modul "Kalender Banner" f�r Scoutnet Modulsystem 
	Dateiname : kalender_banner.tpl
	Autor : Scoutnet Kalender-Team - Christopher Vogt
	Letzte �nderung : 02.07.2003
	Version : 1.0
	notwendige Konfiguration : keine
	W3C konformit�t : Transitional
	Bemerkungen : 	Dieses Template ist als Modul f�r das ScoutNet Modulsystem gedacht und
					zeigt Einen Banner mit Ebene und Name des Kalender an
 *}

<table border="0" cellspacing="0" cellpadding="3">
	<tr>
		<td align=center>	
		<font size="+2" face="Arial, Helvetica, sans-serif"><b>Kalender&nbsp;von&nbsp;{$kalender.ebene}&nbsp;{$kalender.name}</b></font>
		</td>
    </tr>
</table>
{/strip}