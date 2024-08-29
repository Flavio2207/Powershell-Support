$path = 'C:\users\flopes\Downloads'
[int]$totalSize = 0
$fileInfo = Get-ChildItem $path -Recurse
foreach ($file in $fileInfo) {
    $totalSize += $file.Length
}
Write-Host "The total size of file in $path is $($totalSize /1GB) GB."