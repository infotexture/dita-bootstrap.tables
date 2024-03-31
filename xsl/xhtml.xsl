<?xml version="1.0" encoding="utf-8"?>
<!--
  This file is part of the DITA Bootstrap tables plug-in for DITA Open Toolkit.
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

  <xsl:include href="../Customization/xsl/tables.xsl"/>

  <xsl:template match="/ | @* | node()" mode="processHDF">
      <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
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
  </xsl:template>
</xsl:stylesheet>
