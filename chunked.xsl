<!--
  Generates chunked XHTML documents from DocBook XML source using DocBook XSL
  stylesheets.

  NOTE: The URL reference to the current DocBook XSL stylesheets is
  rewritten to point to the copy on the local disk drive by the XML catalog
  rewrite directives so it doesn't need to go out to the Internet for the
  stylesheets. This means you don't need to edit the <xsl:import> elements on
  a machine by machine basis.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/xhtml/chunk.xsl"/>
<xsl:import href="common.xsl"/>
<!-- Begin of customization -->
<xsl:output method="xhtml" indent="yes"/>
<!-- Header -->
<xsl:template name="breadcrumbs">
  <xsl:param name="this.node" select="."/>
  <div class="breadcrumbs">
    <xsl:for-each select="$this.node/ancestor::*">
      <span class="breadcrumb-link">
        <a>
          <xsl:attribute name="href">
            <xsl:call-template name="href.target">
              <xsl:with-param name="object" select="."/>
              <xsl:with-param name="context" select="$this.node"/>
            </xsl:call-template>
          </xsl:attribute>
          <xsl:apply-templates select="." mode="title.markup"/>
        </a>
      </span>
      <xsl:text> &gt; </xsl:text>
    </xsl:for-each>
    <!-- And display the current node, but not as a link -->
    <span class="breadcrumb-node">
      <xsl:apply-templates select="$this.node" mode="title.markup"/>
    </span>
   <hr />
  </div>
</xsl:template>

<xsl:template name="user.head.content">
<xsl:call-template name="breadcrumbs"/>
  <xsl:comment> (c) 2011 Copyright yaVDR-Team </xsl:comment>
  <meta name="lang" content="de"></meta>

</xsl:template>
<!-- Title -->
<!--<xsl:template match="//head/title">
  <title>
        yaVDR-Doku: <xsl:value-of select="//title[1]/text()"/>
  </title>
</xsl:template> -->
<!-- Footer -->
<xsl:template name="user.footer.content">
<div class="footer">
<script type="text/javascript">
    var pkBaseURL = (("https:" == document.location.protocol) ? "https://www.yavdr.org/pywyk/" : "http://www.yavdr.org/pywyk/");
    document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try {
var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 1);
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script><noscript><p><img src="http://www.yavdr.org/pywyk/piwik.php?idsite=1" style="border:0" alt="" /></p></noscript>
        </div>
</xsl:template>
<!--
End of customization -->
<xsl:param name="navig.graphics.path">images/icons/</xsl:param>
<xsl:param name="admon.graphics.path">images/icons/</xsl:param>
<xsl:param name="callout.graphics.path" select="'images/icons/callouts/'"/>
</xsl:stylesheet>
