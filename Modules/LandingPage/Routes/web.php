<?php
use Illuminate\Support\Facades\Route;
use Modules\LandingPage\Http\Controllers\LandingPageController;
use Modules\LandingPage\Http\Controllers\FormController;

// routes/web.php

// Route::get('/pricing', function () {
//     return view('layouts.pricing');
// });

Route::get('/', [LandingPageController::class, 'home'])->name('home');
Route::get('/pricing', [LandingPageController::class, 'pricing'])->name('pricing');
Route::get('/contact', [LandingPageController::class, 'contact'])->name('contact');
Route::get('/blog', [LandingPageController::class, 'blog'])->name('blog');
Route::get('/How-HR-Software-is-Revolutionizing-Remote-Work-Management', [LandingPageController::class, 'blog1'])->name('blog1');
// Route::get('/blog2', [LandingPageController::class, 'blog2'])->name('blog2');

// Route::get('/blog1', function () {
//     return view('Modules.LandingPage.Resources.views.layouts.blog1');
// })->name('blog1');

Route::get('/Top-8-Must-Have-Features-in-HR-Software-for-2024', [LandingPageController::class, 'blog2'])->name('blog2');
Route::get('/The-Future-of-HR-Analytics', [LandingPageController::class, 'blog3'])->name('blog3');
Route::get('/7-Ways-Modern-HRM-Software-Is-Revolutionizing-Workforce-Management-in-2025', [LandingPageController::class, 'blog4'])->name('blog4');
Route::get('/privacy-policy', [LandingPageController::class, 'privacy'])->name('privacy');






Route::get('pages/{slug}', 'CustomPageController@customPage')->name('custom.page')->middleware('XSS');

Route::resource('join_us', JoinUsController::class)->middleware('auth');
Route::post('join_us/store/', 'JoinUsController@joinUsUserStore')->name('join_us_store');

Route::post('/submit-form', [FormController::class, 'submitForm'])->name('submit.form');


Route::group(
    [
        'middleware' => [
            'auth',
            'XSS',
        ],
    ],
    function () {

Route::resource('landingpage', LandingPageController::class)->middleware('auth');
// Route::get('landingpage/', 'LandingPageController@index')->name('landingpage.index');




Route::resource('custom_page', CustomPageController::class)->middleware('auth');
Route::post('custom_store/', 'CustomPageController@customStore')->name('custom_store');



Route::resource('homesection', HomeController::class)->middleware('auth');
// Route::get('homesection/', 'HomeController@index')->name('homesection.index');

// routes/web.php or Modules/LandingPage/Routes/web.php






Route::resource('features', FeaturesController::class)->middleware('auth');

Route::get('feature/create/', 'FeaturesController@feature_create')->name('feature_create');
Route::post('feature/store/', 'FeaturesController@feature_store')->name('feature_store');
Route::get('feature/edit/{key}', 'FeaturesController@feature_edit')->name('feature_edit');
Route::post('feature/update/{key}', 'FeaturesController@feature_update')->name('feature_update');
Route::get('feature/delete/{key}', 'FeaturesController@feature_delete')->name('feature_delete');

Route::post('feature_highlight_create/', 'FeaturesController@feature_highlight_create')->name('feature_highlight_create');

Route::get('features/create/', 'FeaturesController@features_create')->name('features_create');
Route::post('features/store/', 'FeaturesController@features_store')->name('features_store');
Route::get('features/edit/{key}', 'FeaturesController@features_edit')->name('features_edit');
Route::post('features/update/{key}', 'FeaturesController@features_update')->name('features_update');
Route::get('features/delete/{key}', 'FeaturesController@features_delete')->name('features_delete');



Route::resource('discover', DiscoverController::class)->middleware('auth');
Route::get('discover/create/', 'DiscoverController@discover_create')->name('discover_create');
Route::post('discover/store/', 'DiscoverController@discover_store')->name('discover_store');
Route::get('discover/edit/{key}', 'DiscoverController@discover_edit')->name('discover_edit');
Route::post('discover/update/{key}', 'DiscoverController@discover_update')->name('discover_update');
Route::get('discover/delete/{key}', 'DiscoverController@discover_delete')->name('discover_delete');



Route::resource('screenshots', ScreenshotsController::class)->middleware('auth');
Route::get('screenshots/create/', 'ScreenshotsController@screenshots_create')->name('screenshots_create');
Route::post('screenshots/store/', 'ScreenshotsController@screenshots_store')->name('screenshots_store');
Route::get('screenshots/edit/{key}', 'ScreenshotsController@screenshots_edit')->name('screenshots_edit');
Route::post('screenshots/update/{key}', 'ScreenshotsController@screenshots_update')->name('screenshots_update');
Route::get('screenshots/delete/{key}', 'ScreenshotsController@screenshots_delete')->name('screenshots_delete');


Route::resource('pricing_plan', PricingPlanController::class)->middleware('auth');



Route::resource('faq', FaqController::class)->middleware('auth');
Route::get('faq/create/', 'FaqController@faq_create')->name('faq_create');
Route::post('faq/store/', 'FaqController@faq_store')->name('faq_store');
Route::get('faq/edit/{key}', 'FaqController@faq_edit')->name('faq_edit');
Route::post('faq/update/{key}', 'FaqController@faq_update')->name('faq_update');
Route::get('faq/delete/{key}', 'FaqController@faq_delete')->name('faq_delete');


Route::resource('testimonials', TestimonialsController::class)->middleware('auth');
Route::get('testimonials/create/', 'TestimonialsController@testimonials_create')->name('testimonials_create');
Route::post('testimonials/store/', 'TestimonialsController@testimonials_store')->name('testimonials_store');
Route::get('testimonials/edit/{key}', 'TestimonialsController@testimonials_edit')->name('testimonials_edit');
Route::post('testimonials/update/{key}', 'TestimonialsController@testimonials_update')->name('testimonials_update');
Route::get('testimonials/delete/{key}', 'TestimonialsController@testimonials_delete')->name('testimonials_delete');

// Route::get('footer/', 'FooterController@index')->name('footer.index');
});