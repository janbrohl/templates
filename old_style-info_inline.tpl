{* Entfernt alle unn�tigen Leerzeichen und Leerzeilen bis {/strip} *}{strip}
{*
        Name : Kalender 2.0 Template - Old Style Infoinline
        Dateiname : old_style.tpl
        Autor : Scoutnet Kalender-Team - Christopher Vogt
        Letzte �nderung : 30.09.2003 (Peter D�bbert)
        Version : 1.1.4
        ben�tigte andere Dateien : box_inhalt_datum.tpl ; box_inhalt_eintrag.tpl
        notwendige Konfiguration : keine
        Bemerkungen : Dieses Template bietet das Design des Kalender 1.0 unter Hinzunahme der Infos auf einer Seite
        W3C konformit�t : bisher nicht getestet
        �nderungen in Version 1.1.4 - 30.09.2003:
                - Die Infos zu den jeweiligen Terminen werden direkt in der Tabelle angezeigt. F�r die Stufen werden die kleine Symbole mit angezeigt. Der Link heisst jetzt Termine verwalten anstatt Termin eintragen.
        �nderungen in Version 1.1.3 - 16.07.2003:
                - Als Autor wird jetzt entweder Vor- und/oder Nachname angezeigt (wenn in der Community eingegeben) und sonst der Nickname des Autors
        �nderungen in Version 1.1.2 - 16.07.2003:
                - Korrektur der Datumsanzeige, vielen Dank an den freundlichen Finder: Christian Mertens
        �nderungen in Version 1.1.1 - 15.07.2003:
                - nl2br: Zeilenumbr�che in den Infos werden in HTML Zeilenumbr�che umgewandelt
        �nderungen in Version 1.1.0 - 13.07.2003:
                - Pfad zu old_style.tpl auch f�r infos_zeigen.tpl in der JavaScript Funktion infoszeigen
                - Korrektur des setzens von "checked" wenn kein ebenenup �bergeben wurde
                - kleinere Designanpassungen
                - Es gibt nun viele Konfigurationsm�glichkeiten am Anfang und �ber die URL
        �nderungen in Version 1.0.1 - 05.07.2003:
                - absoluter Pfad zu show.php in der JavaScript Funktion infoszeigen
*}

{* START - STANDARDKONFIGURATIONSBEREICH entsprechend denen im Adminbereich des Kalender 1.0*}
        {* Hintergrundfarbe *}
        {assign var="bgcolor" value="ffffff"}
        {* Hintergrundbild *} {* f�r ein Hintergrundbild z.B. value="http://gandalf.wtal.de/grafik/haupthintergrund.gif" *}
        {assign var="background" value=""}
        {* Hintergrundbild Eigenschaften *}        {* f�r ein fixiertes Hintergrundbild (Wasserzeichen) value="fixed" *}
        {assign var="bgproperties" value="false"}
        {* Schriftfarbe *}
        {assign var="fontcolor" value="000000"}
        {* Schriftgr��e *}
        {assign var="fontsize" value="2"}
        {* Schriftart *}
        {assign var="fontface" value="Arial"}
        {* Schrift Fett? *}
        {assign var="fett" value="false"}
        {* Schrift Kursiv? *}
        {assign var="kursiv" value="false"}
        {* Link und �berschrift verwenden? *}
        {assign var="link" value="false"}
{*  ENDE - STANDARDKONFIGURATIONSBEREICH *}

{* START - �berschreiben der STANDARDKONFIGURATION durch Parameter *}
        {assign_array var="configvars" values="bgcolor;background;bgproperties;fontcolor;fontsize;fontface;link;fett;kursiv" delimiter=";"}
        {foreach item=configvar from=$configvars}
                {if isset($urlparameters.$configvar)}
                        {assign var=$configvar value=$urlparameters.$configvar}
                {/if}
        {/foreach}

{*  ENDE - �berschreiben der STANDARDKONFIGURATION durch Parameter *}


        {* Sonstiges *}
        {assign var="ueberschriftsize" value=$fontsize|math:"x+1"}
        {assign var="ueberschriftface" value="Arial"}
        {assign var="monatsface" value="Arial Black"}
        {if $fett&&$fett!="false"}
                {assign var="starttags" value="<b>"}
                {assign var="endtags" value="</b>"}
        {else}
                {assign var="starttags" value=""}
                {assign var="endtags" value=""}
        {/if}
        {if $kursiv&&$kursiv!="false"}
                {assign var="starttags" value="$starttags<i>"}
                {assign var="endtags" value="</i>$endtags"}
        {else}
                {assign var="starttags" value="$starttags"}
                {assign var="endtags" value="$endtags"}
        {/if}



{* Zuweisung der richtigen Gruppe (nur n�tig, wenn man den URL-Parameter groupby nicht �bergibt) *}
        {if $groups.jahrmonat}
                {assign var="groups" value="`$groups.jahrmonat`"}
        {/if}
{/strip}<html>
<head>
<title>ScoutNet-Kalender f�r {$kalender.ebene} {$kalender.name}</title>

{literal}
<SCRIPT LANGUAGE=JavaScript>
<!-- Begin
  function infoszeigen(id)
    {
        {/literal}{strip}
    popupWin = window.open('

        http://kalender.scoutnet.de/2.0/show.php?

        entryids='+id+'&
        template={$template_path}/infos_zeigen.tpl&
        bgcolor={$bgcolor}&
        {if $background&&$background!="false"}background={$background}&{/if}
        {if $bgproperties&&$bgproperties!="false"}bgproperties={$bgproperties}&{/if}
        fontcolor={$fontcolor}&fontsize={$fontsize}&
        {if $fontface}fontface={$fontface}&{/if}
        {if $kursiv&&$kursiv!="false"}fett={$fett}&{/if}
        {if $kursiv&&$kursiv!="false"}kursiv={$kursiv}{/if}

        ','windy','toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,copyhistory=no,scrollbars=yes,width=430,height=250,top='+((screen.height/2)-100)+',left='+((screen.width/2)-250)+'');
        {/strip}{literal}
          if (parseFloat(navigator.appVersion) < 3) {
          } else {
                popupWin.focus();
          }
    }
//-->
</script>
{/literal}
</head>
<body bgcolor=#{$bgcolor} {if $background&&$background!="false"}background={$background} {/if}{if $bgproperties&&$bgproperties!="false"}bgproperties={$bgproperties} {/if}link=#{$fontcolor} vlink=#{$fontcolor} alink=#{$fontcolor}>

{* Entfernt alle unn�tigen Leerzeichen und Leerzeilen bis {/strip} *}{strip}
{foreach from=$url_parameters key=name item=value}
        {if $name != "ebenenup" && $name != "groupby"}
                {assign var="parameters" value="$parameters$name=$value&"}
        {/if}
{/foreach}

<table width=100% border=0 cellspacing=0 cellpadding=0>
  <tr>
    <td width=30%><div align=left><font size="{$fontsize}" {if $fontface}face="{$fontface}" {/if}color="#{$fontcolor}">{$smarty.now|date_format:"Heute ist %A, der %d.%m.%Y.<br>Es ist %H:%M Uhr."}</font></div></td>
        <td align=center width=40%>{if (($link==true)&&($link!="false"))}<div align=middle><font size="{$fontsize}" {if $fontface}face="{$fontface}" {/if}>{if $kalender.homepage}<a href="{$kalender.homepage}" target="_parent">{/if}{$kalender.ebene}&nbsp;{$kalender.name}{if $kalender.homepage}</a>{/if}</font></div>{/if}</td>
    <td width=30%><div align=right>
        {if $kalender.id != 3}
                {assign var="temp_kalender" value=$kalender}
                   <FORM method=get action=/redirect.asp><font size="{$fontsize}" {if $fontface}face="{$fontface}" {/if}color="#{$fontcolor}">Termine bis </font>
                <SELECT name=gotourl onChange='location.href=this.form.gotourl.options[this.form.gotourl.selectedIndex].value; return false;'>
                {section loop=10 name="menu"}
                        {if $temp_kalender.id >= 3}
                                <option value="show.php?{$parameters}groupby=startdatum.%Y-%m&ebenenup={$smarty.section.menu.index}"{if isset($url_parameters.ebenenup) && $url_parameters.ebenenup == $smarty.section.menu.index} selected{/if}> {$temp_kalender.ebene}</option>
                                {assign var="temp_kalender" value=$temp_kalender.gehoertzu}
                        {/if}
                {/section}
            </SELECT><font size="{$fontsize}" {if $fontface}face="{$fontface}" {/if}color="#{$fontcolor}"> anzeigen...</font>
            </form>
        {/if}</div>
    </td>
  </tr>
</table>
<br><br>
<center><table border=0 cellspacing=3 cellpadding=5>

    {foreach from=$groups item=monat}
    <tr>
        <td><br></td>
        <td><br></td>
        <td><br></td>
        <td><br></td>
            </tr>
    <tr>
        <td colspan="5" align="center"><b><font color="#{$fontcolor}" face="{$monatsface}"><b><u>{$monat.startdatum|date_format:"%B'%y"}</U></b></font></B></td>

    </tr>
    {foreach from=$monat.eintraege item=eintrag}
    <tr>
        <td valign="top"><font size="{$fontsize}" {if $fontface}face="{$fontface}" {/if}color="#{$fontcolor}">{$starttags}{$eintrag.startdatum|date_format:"%A"|truncate:2:""}{$eintrag.startdatum|date_format:", %d.%m."} {if $eintrag.enddatum!= ""}&nbsp;-&nbsp;{$eintrag.enddatum|date_format:"%A"|truncate:2:""}{$eintrag.enddatum|date_format:", %d.%m."}{/if}<br>{$eintrag.startzeit|date_format:"%H:%M"}{if $eintrag.endzeit!= ""}&nbsp;-&nbsp;{$eintrag.endzeit|date_format:"%H:%M"}{/if}{$endtags}</font></td>

        <td valign="top"><font size="{$fontsize}" {if $fontface}face="{$fontface}" {/if}color="#{$fontcolor}">{$starttags}<b>{$eintrag.titel}</B>{$endtags}<br>
{$starttags}{$eintrag.ort}{$endtags}</font></td>
        <td valign="top"><font size="{$fontsize}" {if $fontface}face="{$fontface}" {/if}color="#{$fontcolor}">{$starttags}{$eintrag.kategorie}<br>{$eintrag.stufe.bildlich_scoutnet}{$endtags}</font></td>
        <td valign="top"><font size="{$fontsize}" {if $fontface}face="{$fontface}" {/if}color="#{$fontcolor}">{$starttags}{if $eintrag.autor.vorname || $eintrag.autor.nachname}{$eintrag.autor.vorname}&nbsp;{$eintrag.autor.nachname}{else}{$eintrag.autor.nickname}{/if}<br>{$eintrag.kalender.ebene}{$endtags}</font></td>

                </tr>
    {if $eintrag.info != ""}
 <tr><td colspan="4" valign="top"><font size="{$fontsize}" {if $fontface}face="{$fontface}" {/if}color="#{$fontcolor}">{$starttags}{$eintrag.info|nl2br}{$endtags}</font></td></tr>
    {else}
           <td valign="top"><font size="{$fontsize}" {if $fontface}face="{$fontface}" {/if}color="#{$fontcolor}">{$starttags}{$eintrag.info|nl2br}{$endtags}</font></td>
                   {/if}<tr><td colspan="4"><hr width="100%"></td></tr>

    {/foreach}
        {/foreach}
</table>
<br><p><div align=center>
<table border=0 cellspacing=0 cellpadding=0>
  <tr>
    <td width=10><p align=center><font size="{$fontsize}" {if $fontface}face="{$fontface}" {/if}color="#{$fontcolor}">[</font></td>
            <td><p><a href="http://kalender.scoutnet.de/infos/index.htm" target="_blank"><font size="{$fontsize}" {if $fontface}face="{$fontface}" {/if}color="#{$fontcolor}"><b>Infos&nbsp;zum&nbsp;ScoutNet-Kalender</b></font></a></p>
                </td>
    <td width=10><p align=center><font size="{$fontsize}" {if $fontface}face="{$fontface}" {/if}color="#{$fontcolor}">|</font></td>
    <td width=10><p align=center><font size="{$fontsize}" {if $fontface}face="{$fontface}" {/if}color="#{$fontcolor}">|</font></td>
            <td><a href="http://community.scoutnet.de/" target="_blank"><font size="{$fontsize}" {if $fontface}face="{$fontface}" {/if}color="#{$fontcolor}"><b>Termine&nbsp;verwalten</b></font></a></td>
    <td width=10><p align=center><font size="{$fontsize}" {if $fontface}face="{$fontface}" {/if}color="#{$fontcolor}">]</font></td>
  </tr>
</table></center>
</div>{/strip}

</body>

</html>