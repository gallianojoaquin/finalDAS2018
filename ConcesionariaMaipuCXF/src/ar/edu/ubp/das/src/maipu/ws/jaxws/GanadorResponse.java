
package ar.edu.ubp.das.src.maipu.ws.jaxws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 * This class was generated by Apache CXF 3.1.7
 * Fri Aug 10 18:44:10 ART 2018
 * Generated source version: 3.1.7
 */

@XmlRootElement(name = "ganadorResponse", namespace = "http://ws.maipu.src.das.ubp.edu.ar/")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ganadorResponse", namespace = "http://ws.maipu.src.das.ubp.edu.ar/")

public class GanadorResponse {

    @XmlElement(name = "return")
    private java.lang.String _return;

    public java.lang.String getReturn() {
        return this._return;
    }

    public void setReturn(java.lang.String new_return)  {
        this._return = new_return;
    }

}

