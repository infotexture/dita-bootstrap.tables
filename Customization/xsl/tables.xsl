<?xml version="1.0" encoding="UTF-8"?>
<!--
  This file is part of the DITA Bootstrap plug-in for DITA Open Toolkit.
  See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:table="http://dita-ot.sourceforge.net/ns/201007/dita-ot/table"
  version="2.0"
  exclude-result-prefixes="xs dita-ot table"
>

  <xsl:template match="*[@otherprops]" mode="frame-processing">
     <xsl:choose>
        <xsl:when test="@frame = 'sides'">
          <xsl:attribute name="class" select="'border-start border-end p-3'"/>
        </xsl:when>
        <xsl:when test="@frame = 'top'">
          <xsl:attribute name="class" select="'border-top pt-3'"/>
        </xsl:when>
        <xsl:when test="@frame = 'bottom'">
          <xsl:attribute name="class" select="'border-bottom p-3'"/>
        </xsl:when>
        <xsl:when test="@frame = 'topbot'">
          <xsl:attribute name="class" select="'border-top border-bottom p-3'"/>
        </xsl:when>
        <xsl:when test="@frame = 'all'">
          <xsl:attribute name="class" select="'border p-3'"/>
        </xsl:when>
        <xsl:when test="@frame = 'none'">
          <xsl:attribute name="class" select="'border-0 p-3'"/>
        </xsl:when>
      </xsl:choose>
  </xsl:template>

  <xsl:template match="*[contains(@class,' topic/table ')]" name="topic.table">
    <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-startprop ')]" mode="out-of-line"/>

    <div>
      <!-- ↓ Add Bootstrap CSS frame processing ↓ -->
      <xsl:apply-templates select="." mode="frame-processing"/>
      <!-- ↑ End customization · Continue with DITA-OT defaults ↓ -->
      <table>
        <!-- ↓ Add Bootstrap CSS class processing ↓ -->
        <xsl:call-template name="commonattributes"/>
        <xsl:call-template name="otherprops-attributes"/>
        <xsl:if
          test="contains(@otherprops, 'search') or contains(@otherprops, 'sortable')  or contains(@otherprops, 'pagination') "
        >
          <xsl:attribute name="data-toggle" select="'table'"/>
          <xsl:if test="matches(dita-ot:get-current-language(.), $BOOTSTRAP_TABLE_SUPPORTED_LANGUAGE)">
            <xsl:attribute name="data-locale" select="dita-ot:get-current-language(.)"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="contains(@otherprops, 'search')">
          <xsl:attribute name="data-search" select="'true'"/>
          <xsl:attribute name="data-search-accent-neutralise" select="'true'"/>
          <xsl:variable name="direction">
            <xsl:apply-templates select="." mode="get-render-direction">
              <xsl:with-param name="lang" select="dita-ot:get-current-language(.)"/>
            </xsl:apply-templates>
          </xsl:variable>
          <xsl:if test="$direction='rtl'">
            <xsl:attribute name="data-search-align" select="'left'"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="contains(@otherprops, 'sortable')">
          <xsl:attribute name="data-sortable" select="'true'"/>
        </xsl:if>
        <xsl:if test="contains(@otherprops, 'pagination')">
          <xsl:attribute name="data-pagination" select="'true'"/>
          <xsl:choose>
            <xsl:when test="contains(@otherprops, 'pagination-100')">
              <xsl:attribute name="data-page-size" select="'100'"/>
            </xsl:when>
            <xsl:when test="contains(@otherprops, 'pagination-50')">
              <xsl:attribute name="data-page-size" select="'50'"/>
            </xsl:when>
            <xsl:when test="contains(@otherprops, 'pagination-25')">
              <xsl:attribute name="data-page-size" select="'25'"/>
            </xsl:when>
          </xsl:choose>
        </xsl:if>

        <!-- ↑ End customization · Continue with DITA-OT defaults ↓ -->
        <xsl:call-template name="setid"/>
        <xsl:apply-templates select="." mode="css-class"/>
        <xsl:apply-templates select="." mode="table:title"/>
        <!-- title and desc are processed elsewhere -->
        <xsl:apply-templates select="*[contains(@class, ' topic/tgroup ')]"/>
      </table>
    </div>

    <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-endprop ')]" mode="out-of-line"/>
  </xsl:template>


  <xsl:template match="*[table:is-thead-entry(.)]">
    <th>
      <xsl:if test="contains(ancestor::*[contains(@class,' topic/table ')]/@otherprops, 'sortable')">
        <xsl:attribute name="data-sortable" select="'true'"/>
      </xsl:if>
      <xsl:apply-templates select="." mode="table:entry"/>
    </th>
  </xsl:template>

</xsl:stylesheet>
