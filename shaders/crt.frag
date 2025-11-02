        #pragma header

        uniform float time;
        uniform vec2 resolution;

        uniform float chromaOffset;   // e.g. 0.003
        uniform float bloomThreshold; // e.g. 0.8
        uniform float bloomStrength;  // e.g. 0.6
        uniform float scanStrength;   // e.g. 0.15

        vec2 curveUV(vec2 uv)
        {
            uv = (uv - 0.5) * 2.0;
            uv *= 1.1;
            uv.x *= 1.0 + pow((abs(uv.y)/5.0),2.0);
            uv.y *= 1.0 + pow((abs(uv.x)/4.0),2.0);
            uv = (uv / 2.0) + 0.5;
            return uv;
        }

        vec3 getChromatic(vec2 uv)
        {
            float off = chromaOffset;
            float r = texture2D(bitmap, uv + vec2(off, 0.0)).r;
            float g = texture2D(bitmap, uv).g;
            float b = texture2D(bitmap, uv + vec2(-off, 0.0)).b;
            return vec3(r, g, b);
        }

        vec3 applyBloom(vec2 uv)
        {
            vec3 col = texture2D(bitmap, uv).rgb;
            vec3 bright = max(vec3(0.0), col - bloomThreshold);
            float offs = 1.0 / resolution.x * 4.0;

            bright += texture2D(bitmap, uv + vec2( offs,  0.0)).rgb;
            bright += texture2D(bitmap, uv + vec2(-offs,  0.0)).rgb;
            bright += texture2D(bitmap, uv + vec2( 0.0,  offs)).rgb;
            bright += texture2D(bitmap, uv + vec2( 0.0, -offs)).rgb;

            bright *= bloomStrength;
            return col + bright;
        }

        void main()
        {
            vec2 uv = openfl_TextureCoordv.xy;
            vec2 cUV = curveUV(uv);

            if (cUV.x < 0.0 || cUV.x > 1.0 || cUV.y < 0.0 || cUV.y > 1.0)
            {
                gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);
                return;
            }

            vec3 color = getChromatic(cUV);
            color = applyBloom(cUV);

            float scan = sin(uv.y * resolution.y * 1.5);
            color *= 1.0 - scanStrength + scanStrength * scan;

            float vig = 0.5 + 0.5 * pow(16.0 * uv.x * uv.y * (1.0 - uv.x) * (1.0 - uv.y), 0.3);
            color *= vig;

            gl_FragColor = vec4(color, 1.0);
        }