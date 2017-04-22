<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--
    <xsl:import href="http://docbook.sourceforge.net/release/xsl/1.77.0/html/docbook.xsl"/>
-->
    <xsl:import href="../../../docbook/xsl/1.77.0/html/docbook.xsl"/>
    <xsl:include href="customization.common.xsl"/>

    <!--
     | ========================================================================
     | 1.11 Tables
     | ========================================================================
     +-->
    <!--
    <xsl:param name="html.cellpadding">2</xsl:param>
    -->
    <!--
     | ========================================================================
     | 2.3 ToC/LoT/Index Generation
     | ========================================================================
     +-->
    <xsl:param name="generate.toc">
    article toc
    </xsl:param>

    <!--
     | ========================================================================
     | 2.4 Processor Extensions
     | ========================================================================
     +-->

     <!--
     | ========================================================================
     | 2.17 Miscellaneous
     | ========================================================================
     +-->
    <!--
    <xsl:param name="shade.verbatim" select="1"/>
    <xsl:attribute-set name="shade.verbatim.style">
      <xsl:attribute name="bg-color">#D8EBC8</xsl:attribute>
      <xsl:attribute name="border-width">0.5pt</xsl:attribute>
      <xsl:attribute name="border-style">solid</xsl:attribute>
      <xsl:attribute name="border-color">#7AB943</xsl:attribute>
      <xsl:attribute name="padding">3pt</xsl:attribute>
    </xsl:attribute-set>
    -->

    <!--
     | ========================================================================
     | 2.18 Graphics
     | ========================================================================
     +-->

    <!--
     | ========================================================================
     | 2.19 Pagination and General Styles
     | ========================================================================
     +-->
    <!--
    <xsl:param name="table.borders.with.css" select="0"></xsl:param>
    -->
    <xsl:param name="css.decoration" select="1"></xsl:param>
    <xsl:param name="make.clean.html" select="1"></xsl:param> 
    <xsl:param name="custom.css.source">css/dnet.css.xml</xsl:param>

</xsl:stylesheet>
