<?php

class App_Util_Paginator
{
	private $_totalRows = 0;
	private $_limit = 10;
	private $_offset = 0;
	private $_pageNumber = 1;
	// Root url
	private $_url = null;
	private $_extraUrl = '';
	private $_showLinkPageNumbers = true;
	// Number of number link pages to show, is recommended to set an odd number
	private $_maxLinkNumbers = 9;
	
	public function __construct($url, $totalRows, $currentPage, $limit = 10)
	{
		$this->_url = $url;
		$this->_totalRows = $totalRows;
		$this->_pageNumber = $currentPage;
		$this->_limit = $limit;
		$this->_offset = ((int)$this->_pageNumber - 1) * $this->_limit;
	}
	
	public function getLimit()
	{
		return $this->_limit;
	}
	
	public function getOffset()
	{
		return $this->_offset;
	}
	
	public function addExtraUrlData($extraUrl)
	{
		$this->_extraUrl = $extraUrl;
	}
	
	public function clearExtraUrlData()
	{
		$this->_extraUrl = '';
	}
	
	public function setMaxLinkNumbers($maximunToShow)
	{
		$this->_maxLinkNumbers = $maximunToShow;
	}
	
	public function showLinkPageNumbers($boolean)
	{
		$this->_showLinkPageNumbers = $boolean;
	}
		
	public function showHtmlPaginator()
	{
		$totalPages = $this->_totalRows/$this->_limit;
				
		// If the result is a decimal, it is added one page number
		if((float)((int)($totalPages)) < (float)($totalPages))
		{
			$totalPages = (int)($totalPages) + 1;
		}
		
		// If we are in first page
		if($this->_pageNumber == 1)
			$previous = null;
		else if($this->_pageNumber > 1)
			$previous = $this->_pageNumber - 1;
		
		// If we are in the last page
		if((int)$this->_pageNumber == $totalPages ||  $this->_totalRows == 0)
			$next = null;
		else if($totalPages > 1 && $this->_totalRows > 0)
			$next = $this->_pageNumber + 1;
			
		
		$htmlPaginator = "";
		
		
		if ($totalPages){
			$htmlPaginator .= "<div class='paginationControl'>[$this->_pageNumber de $totalPages] ";
			
			// First page link
			if ($this->_pageNumber != 1)
				//$htmlPaginator .= "<a href='" . $this->url(array('page' => '1')) ."'>Primero</a> |";
				$htmlPaginator .= " <a href='".$this->_url."/page/1". $this->_extraUrl ."'>Primero</a> |";
			else
				$htmlPaginator .= "<span class='disabled'> Primero </span> |";
			
			
			// Previous page link
			if (isset($previous))
				//$htmlPaginator .= "<a href='". $this->url(array('page' => $previous)) . "'>&lt; Previo</a> |";
				$htmlPaginator .= " <a href='".$this->_url."/page/$previous". $this->_extraUrl ."'>&lt; Previo</a> |";
			else
				$htmlPaginator .= "<span class='disabled'> &lt; Previo</span> |";
			
			//--------------------------------------------------------------------------
			// Show numbers
			if($this->_showLinkPageNumbers == true)
			{
				$initial = 1;
				$final = $totalPages;
				
				if($this->_maxLinkNumbers < $totalPages)
				{
					$showHalf = round(($this->_maxLinkNumbers / 2), 0, PHP_ROUND_HALF_DOWN);
					
					$initial = $this->_pageNumber - $showHalf;
					$final = $this->_pageNumber + $showHalf;
					
					// If the number to pages to show is integer, 
					if($showHalf == ($this->_maxLinkNumbers / 2))
						$initial += 1; 
					
					if($initial <= 0)
					{
						$right = ($initial * (-1)) + 1; 
						$initial = 1;
						$final += $right;
					}
					else if($final > $totalPages)
					{
						$left = $final - $totalPages;
						$final = $totalPages;
						$initial -= $left; 
					}
				}
				
				if($initial > 1)
					$htmlPaginator .= " ...";
				
				
				for($page = $initial; $page <= $final; $page++)
				{
					if($page != $this->_pageNumber)
						$htmlPaginator .= " <a href='".$this->_url."/page/$page". $this->_extraUrl ."'>$page</a> ";
					else
						$htmlPaginator .= "<span class='disabled'> <b>$page</b></span>";
				}
				
				if($final < $totalPages)
					$htmlPaginator .= "... ";
				
				$htmlPaginator .= " |";
			}
			
			//--------------------------------------------------------------------------			
			// Next page link
			if (isset($next))
				$htmlPaginator .= " <a href='".$this->_url."/page/$next". $this->_extraUrl ."'>Siguiente &gt;</a> |";
			else
				$htmlPaginator .= "<span class='disabled'> Siguiente &gt; </span> |";
			
			// Last page link
			if ($this->_pageNumber != $totalPages)
				$htmlPaginator .= " <a href='".$this->_url."/page/$totalPages". $this->_extraUrl ."'>Ultimo</a> ";
			else
				$htmlPaginator .= "<span class='disabled'> Ultimo </span>";
			
			$htmlPaginator .= "</div>";
		}
		
		return $htmlPaginator;
	}	
}

?>