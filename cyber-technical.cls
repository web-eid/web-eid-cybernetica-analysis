% cyber-technical.cls
% Class for Cybernetica technical documents

\ProvidesClass{cyber-technical}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{cyber-common}}
\ProcessOptions\relax
\LoadClass{cyber-common}


