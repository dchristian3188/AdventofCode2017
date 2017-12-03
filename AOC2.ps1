#http://adventofcode.com/2017/day/2
Function Start-AOC2
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $InputObject
    )
          
    $rawSpreadsheet = Get-Content -Path $InputObject
    $checkSum = 0
    foreach($row in $rawSpreadsheet)
    {
        $values =  $row -split '\s' | 
            ForEach-Object {$PSItem -as [int]} | 
            Sort-Object
        $min = $values[0]
        $max = $values[-1]
        $checkSum += ($max - $min)
    }
    Write-Output $checkSum
}

Start-AOC2 -InputObject .\AOC2.txt