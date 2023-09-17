<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\News;
use Validator;

class NewsController extends Controller
{
    //
    public function index()
    {
        $news = News::orderBy('created_at', 'desc')->get();
     
        return response()->json([
            "success" => true,
            "message" => "news_list",
            "data" => $news
        ]);
    }

    public function store(Request $request)
    {
        $input = $request->all();
    
        $validator = Validator::make($input, [
            'news_title' => 'required',
            'news_details' => 'required'
        ]);
    
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
    
        $news = News::create($input);
 
        return response()->json([
            "success" => true,
            "message" => "News Created Successfully",
            "data" =>  $news
        ]);
 
    } 
}
