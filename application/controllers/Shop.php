<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Shop extends CI_Controller {
	public function __construct()
	{
		parent::__construct();
		$this->load->model('product_model');
	}
	public function index()
	{
		$data['products'] = $this->product_model->list();
		$this->load->view('shop', $data);
	}
}
