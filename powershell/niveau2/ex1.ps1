$sentence = Read-Host -Prompt 'Entrez la phrase à inverser'
$sentence = $sentence.ToCharArray()
[Array]::Reverse($sentence)
$sentence = -join $sentence
$sentence
