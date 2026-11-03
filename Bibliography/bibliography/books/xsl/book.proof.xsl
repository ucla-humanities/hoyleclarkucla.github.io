<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- The same as book.normal.xsl, but import book.000.xsl rather than inclue it,
         so we can override the display of qft, inserting line breaks for | -->

    <xsl:import href="book.000.xsl"/>
    <xsl:include href="book.600.qft.proof.xsl"/>
    <xsl:output indent="yes" method="html" omit-xml-declaration="yes"/>

</xsl:stylesheet>
