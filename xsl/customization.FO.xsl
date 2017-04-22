<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  version="1.0">

    <!--
    <xsl:import href="http://docbook.sourceforge.net/release/xsl/1.77.0/fo/docbook.xsl"/>
    <xsl:import href="1.77.0/fo/docbook.xsl"/>
    -->
    <xsl:import href="../../../docbook/xsl/1.77.0/fo/docbook.xsl"/>
    <xsl:include href="customization.common.xsl"/>
    <xsl:include href="customization.FO.header.xsl"/>
    <xsl:include href="customization.FO.footer.xsl"/>

    <!--
     | ========================================================================
     | Theme
     | ========================================================================
     +-->
    <xsl:variable name="dnet.fg.color">#d6a785</xsl:variable>
    <xsl:variable name="dnet.bg.color">#eadcc6</xsl:variable>
    
    <xsl:variable name="dnet.header.border.style">solid</xsl:variable>
    <xsl:variable name="dnet.header.border.width">medium</xsl:variable>

    <xsl:variable name="dnet.footer.border.style">solid</xsl:variable>
    <xsl:variable name="dnet.footer.border.width">medium</xsl:variable>

    <xsl:variable name="dnet.section.title.bg.color"><xsl:value-of select="$dnet.bg.color"/></xsl:variable>
    <xsl:variable name="dnet.section.title.border.color"><xsl:value-of select="$dnet.fg.color"/></xsl:variable>
    <xsl:variable name="dnet.section.title.border.style">solid</xsl:variable>
    <xsl:variable name="dnet.section.title.border.width">thick</xsl:variable>
    
    <xsl:variable name="dnet.example.color"><xsl:value-of select="$dnet.bg.color"/></xsl:variable>
    <xsl:variable name="dnet.example.border.color"><xsl:value-of select="$dnet.fg.color"/></xsl:variable>
    <xsl:variable name="dnet.example.border.style">solid</xsl:variable>
    <xsl:variable name="dnet.example.border.width">thick</xsl:variable>

    <xsl:variable name="dnet.table.head.bg.color"><xsl:value-of select="$dnet.bg.color"/></xsl:variable>

    <!--
     | ========================================================================
     | 2.3 ToC/LoT/Index Generation
     | ========================================================================
     +-->
    <xsl:param name="generate.toc">
    article
    </xsl:param>
    <!--
     | ========================================================================
     | 2.4 Processor Extensions
     | ========================================================================
     +-->
    <xsl:param name="fop1.extensions" select="1"/>

    <!--
     | ========================================================================
     | 2.10 Tables
     | ========================================================================
     +-->
    <xsl:attribute-set name="table.cell.padding">
      <xsl:attribute name="padding-start">2px</xsl:attribute>
      <xsl:attribute name="padding-end">2px</xsl:attribute>
      <xsl:attribute name="padding-top">2px</xsl:attribute>
      <xsl:attribute name="padding-bottom">2px</xsl:attribute>
    </xsl:attribute-set>

    <!--
     | ========================================================================
     | 2.17 Miscellaneous
     | ========================================================================
     +-->
      <!--
    <xsl:param name="shade.verbatim" select="0"/>
    <xsl:attribute-set name="shade.verbatim.style">
      <xsl:attribute name="background-color">#D8EBC8</xsl:attribute>
      <xsl:attribute name="border-width">0.5pt</xsl:attribute>
      <xsl:attribute name="border-style">solid</xsl:attribute>
      <xsl:attribute name="border-color">#575757</xsl:attribute>
      <xsl:attribute name="padding">3pt</xsl:attribute>
    </xsl:attribute-set>
    -->

    <!--
     | ========================================================================
     | 2.19 Pagination and General Styles
     | ========================================================================
     +-->
    <xsl:param name="paper.type">A4</xsl:param>
    <xsl:param name="page.orientation">portrait</xsl:param>
    <xsl:param name="column.count.titlepage" select="1"/>
    <xsl:param name="column.count.body" select="1"/>
    <xsl:param name="column.gap.body" select="'10mm'"/>
    <xsl:param name="column.count.toc" select="1"/>
    <xsl:param name="column.count.lot" select="1"/>
    <xsl:param name="page.margin.inner" select="'15mm'"/>
    <xsl:param name="page.margin.outer" select="'15mm'"/>
    <xsl:param name="page.margin.top">10mm</xsl:param>
    <xsl:param name="region.before.extent">15mm</xsl:param>
    <xsl:param name="body.margin.top">20mm</xsl:param>
    <xsl:param name="body.margin.bottom">20mm</xsl:param>
    <xsl:param name="region.after.extent">15mm</xsl:param>
    <xsl:param name="page.margin.bottom">10mm</xsl:param>
    
    <xsl:param name="body.start.indent">
        <xsl:choose>
            <xsl:when test="$fop.extensions != 0">0pt</xsl:when>
            <xsl:when test="$passivetex.extensions != 0">0pt</xsl:when>
            <xsl:otherwise>0mm</xsl:otherwise>
        </xsl:choose>
    </xsl:param>
    <xsl:param name="body.end.indent" select="'0pt'"/>


    <!-- Header customization -->
    <xsl:param name="header.rule">0</xsl:param>
    <!--
    <xsl:param name="header.column.widths">1 2 1</xsl:param>

    <xsl:attribute-set name="header.table.properties">
      <xsl:attribute name="border-color"><xsl:value-of select="$dnet.fg.color"/></xsl:attribute>
      <xsl:attribute name="border-bottom-style"><xsl:value-of select="$dnet.header.border.style"/></xsl:attribute>
      <xsl:attribute name="border-bottom-width"><xsl:value-of select="$dnet.header.border.width"/></xsl:attribute>
    </xsl:attribute-set>
    -->

    <!-- Footer customization -->
    <xsl:param name="footer.rule">0</xsl:param>
    
    <xsl:param name="footer.column.widths">1 1 1</xsl:param>

    <xsl:attribute-set name="footer.table.properties">
      <xsl:attribute name="border-color"><xsl:value-of select="$dnet.fg.color"/></xsl:attribute>
      <xsl:attribute name="border-top-style"><xsl:value-of select="$dnet.footer.border.style"/></xsl:attribute>
      <xsl:attribute name="border-top-width"><xsl:value-of select="$dnet.footer.border.width"/></xsl:attribute>
    </xsl:attribute-set>

    <!--
     | ========================================================================
     | 2.21 Property Sets
     | ========================================================================
     +-->
     <!-- FIXME -->
    <xsl:attribute-set name="informal.object.properties">
       <xsl:attribute name="keep-together.within-column">auto</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="section.title.level1.properties">
      <xsl:attribute name="background-color"><xsl:value-of select="$dnet.section.title.bg.color" /></xsl:attribute>
      <xsl:attribute name="border-color"><xsl:value-of select="$dnet.section.title.border.color" /></xsl:attribute>
      <xsl:attribute name="border-top-style"><xsl:value-of select="$dnet.section.title.border.style" /></xsl:attribute>
      <xsl:attribute name="border-top-width"><xsl:value-of select="$dnet.section.title.border.width" /></xsl:attribute>
      <xsl:attribute name="padding">5px</xsl:attribute>
      <!--
      <xsl:attribute name="border-bottom">1pt solid black</xsl:attribute>
      <xsl:attribute name="padding-top">5px</xsl:attribute>
      <xsl:attribute name="padding-bottom">5px</xsl:attribute>
      -->
    </xsl:attribute-set>

    <xsl:attribute-set name="section.level1.properties">
      <xsl:attribute name="break-before">page</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="example.properties">
      <xsl:attribute name="background-color"><xsl:value-of select="$dnet.example.color" /></xsl:attribute>
      <xsl:attribute name="border-color"><xsl:value-of select="$dnet.example.border.color" /></xsl:attribute>
      <xsl:attribute name="border-left-style"><xsl:value-of select="$dnet.example.border.style" /></xsl:attribute>
      <xsl:attribute name="border-left-width"><xsl:value-of select="$dnet.example.border.width" /></xsl:attribute>
      <xsl:attribute name="margin-top">5px</xsl:attribute>
      <xsl:attribute name="padding">5px</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="monospace.verbatim.properties">
      <xsl:attribute name="wrap-option">wrap</xsl:attribute>
      <!--
      <xsl:attribute name="hyphenation-character">\</xsl:attribute>
      -->
    </xsl:attribute-set>


    <!-- FIXME:
    http://www.sagehill.net/docbookxsl/PrintTableStyles.html#CustomCellProperties 
    -->
    <xsl:template name="table.cell.properties"> 
      <xsl:param name="bgcolor.pi" select="''"/> 
      <xsl:variable name="tabstyle">
        <xsl:call-template name="tabstyle"/>
      </xsl:variable>

      <xsl:variable name="bgcolor">
        <xsl:choose>
        <!--
          <xsl:when test="$tabstyle = 'styleA' 
             and ancestor::thead">#D8EBC8</xsl:when>
        -->
          <xsl:when test="ancestor::thead"><xsl:value-of select="$dnet.table.head.bg.color" /></xsl:when>
          <xsl:when test="$tabstyle = 'styleA'">#DDDDDD</xsl:when>
          <xsl:when test="$bgcolor.pi != ''">
            <xsl:value-of select="$bgcolor.pi"/>
          </xsl:when>
        </xsl:choose>
      </xsl:variable>

      <xsl:if test="$bgcolor != ''">
        <xsl:attribute name="background-color">
          <xsl:value-of select="$bgcolor"/>
        </xsl:attribute>
      </xsl:if>
    </xsl:template>

</xsl:stylesheet>
