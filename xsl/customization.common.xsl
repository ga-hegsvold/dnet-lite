<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!--
     | ========================================================================
     | 2.6 Automatic Labeling
     | ========================================================================
     +-->
    <xsl:param name="chapter.autolabel" select="1"/>
    <xsl:param name="section.autolabel" select="1"/>
    <xsl:param name="section.label.includes.component.label" select="1"/>

    <!--
     | ========================================================================
     | 2.17 Miscellaneous
     | ========================================================================
     +-->
     <!--
    <xsl:param name="hyphenate">false</xsl:param>
    <xsl:param name="hyphenate.verbatim" select="0"/>
     -->
      <!--
    <xsl:param name="shade.verbatim" select="1"/>
    <xsl:attribute-set name="shade.verbatim.style">
      <xsl:attribute name="background-color">#D8EBC8</xsl:attribute>
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
    <xsl:param name="img.src.path">img/</xsl:param>
    <!--
    <xsl:param name="default.image.width">20cm</xsl:param>
    <xsl:param name="ignore.image.scaling" select="0"></xsl:param>
    -->
    <!--
     | ========================================================================
     | 2.19 Pagination and General Styles
     | ========================================================================
     +-->
    <xsl:param name="draft.mode">yes</xsl:param>
    <xsl:param name="draft.watermark.image" select="'http://docbook.sourceforge.net/release/images/draft.png'" />
<!--
    <xsl:param name="draft.watermark.image" select="'img/bg-paper-old-012.jpg'" />
-->
    <xsl:param name="body.font.master">8</xsl:param>
    <!--
    <xsl:param name="body.font.family">verdana</xsl:param>
    -->
    <!--
     | ========================================================================
     | 2.20 Tables
     | ========================================================================
     +-->
    <xsl:param name="table.cell.border.style">solid</xsl:param> 
    <xsl:param name="table.cell.border.width">thin</xsl:param> 
    <!--
     | ========================================================================
     | 2.21 Property Sets
     | ========================================================================
     +-->
    <xsl:attribute-set name="section.properties">
    <!--
    <xsl:attribute name="font-size">
        <xsl:value-of select="$body.font.master"></xsl:value-of>
        <xsl:text>pt</xsl:text>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    -->
    </xsl:attribute-set>

    <xsl:attribute-set name="section.title.properties">
    <!--
        <xsl:attribute name="font-family">
            <xsl:value-of select="$title.font.family"></xsl:value-of>
        </xsl:attribute>
    -->    
        <!-- font size is calculated dynamically by section.heading template -->
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
        <xsl:attribute name="space-before.optimum">1.0em</xsl:attribute>
        <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
	<!--
        <xsl:attribute name="start-indent">
            <xsl:value-of select="$title.margin.left"></xsl:value-of>
        </xsl:attribute>
	-->
    </xsl:attribute-set>
    
    <xsl:attribute-set name="formal.title.properties">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:value-of select="$body.font.master"></xsl:value-of>
            <xsl:text>pt</xsl:text>
        </xsl:attribute>
        <!--
        <xsl:attribute name="hyphenate">false</xsl:attribute>
        <xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
        <xsl:attribute name="space-after.optimum">0.6em</xsl:attribute>
        <xsl:attribute name="space-after.maximum">0.8em</xsl:attribute>
        -->
    </xsl:attribute-set>

</xsl:stylesheet>
