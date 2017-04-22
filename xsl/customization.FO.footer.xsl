<?xml version="1.0"?>
<xsl:stylesheet version='1.0' xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:param name="footer.image.filename">http://docbook.sourceforge.net/release/buttons/docbook-1.png</xsl:param>

  <xsl:template name="footer.content">
    <xsl:param name="position" select="''"/>

    <fo:block>
      
      <xsl:choose>

        <xsl:when test="$position = 'left'">
	  <xsl:if test="count(//editor) > 0">
          Editor: <xsl:apply-templates select="//editor" />
	  </xsl:if>
        </xsl:when>
	
        <xsl:when test="$position = 'right'">
          <fo:external-graphic content-height="0.5cm">
            <xsl:attribute name="src">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$footer.image.filename"/>
              </xsl:call-template>
            </xsl:attribute>
          </fo:external-graphic>
        </xsl:when>
      </xsl:choose>

    </fo:block>
  </xsl:template>

</xsl:stylesheet>
