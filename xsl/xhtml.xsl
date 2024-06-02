<?xml version="1.0" encoding="utf-8"?>
<!--
  This file is part of the DITA Bootstrap Table plug-in for DITA Open Toolkit.
  See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet
  version="2.0"
  xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="xs dita-ot"
>

  <xsl:param name="defaultLanguage" select="'en'" as="xs:string"/>

  <xsl:variable
    name="BOOTSTRAP_TABLE_SUPPORTED_LANGUAGE"
    select="'((af|ar|ca|cs|da|de|el|en|es|et|eu|fa|fi|fr|he|hr|hu|id|it|ja|ka|ko|ms|nb|nl|pl|pt|ro|ru|sk|sv|th|tr|uk|ur|uz|vi|zh)(\-|$))'"
  />

  <xsl:include href="../Customization/xsl/tables.xsl"/>

  <xsl:template match="/ | @* | node()" mode="processHDF" priority="5">
      <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"/>
      <xsl:next-match/>
      <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-table@1.22.4/dist/bootstrap-table.min.css"
      integrity="sha384-1ie48E5ptWCDY9PXLXSMxA+rTXwrP63sKHXh8d9ong3ejEItSDkhid/S5enJvDeB"
      crossorigin="anonymous"
    />
      <script
      src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.22.4/dist/bootstrap-table.min.js"
      integrity="sha384-BJJUi58aYAf48aCP6OEvaED0GHzE/mkiXZkWNKzsxeSFDxFnlbpQ1hNmrXIRagDw"
      crossorigin="anonymous"
    />
    <xsl:if test="matches($defaultLanguage,$BOOTSTRAP_TABLE_SUPPORTED_LANGUAGE)">
      <script
        src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.22.4/dist/bootstrap-table-locale-all.min.js"
        integrity="sha384-04YORxwrzedRoZb9qyVQLGh+qYYSdNKbg26iTJa22Vr43KSHo+qAYB6NRJt8LbdY"
        crossorigin="anonymous"
      />
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
