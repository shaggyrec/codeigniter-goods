<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Shop extends CI_Controller {

	public function index(): void
	{
		$data['products'] = $this->product_model->list();
		$this->load->view('shop', $data);
	}
}
