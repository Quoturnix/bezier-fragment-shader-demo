uniform bool drawFill;
uniform bool drawStroke;
uniform bool fillCutPart;
uniform bool useBezier;

void main (void)  
{
    if (useBezier)
    {
        if (drawStroke && abs(pow(gl_TexCoord[0].s,2)-gl_TexCoord[0].t)<0.01)
        {
            gl_FragColor = vec4(1.0,1.0,1.0,1.0);  
        }
        else if (pow(gl_TexCoord[0].s,2)-gl_TexCoord[0].t>0)
        {
            if (fillCutPart)
                gl_FragColor = vec4(0.4,0.4,1.0,1.0);
            else
                discard;
        }
        else
        {
            if (drawFill)
                gl_FragColor = vec4(0.65,0.15,0.15,1.0); 
            else
                discard;
        }
    }
    else
        gl_FragColor = vec4(0.6,0.8,0.7,1.0);
}
