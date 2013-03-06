from django.http import HttpResponse
from django.template import Context, loader, RequestContext
from django.shortcuts import render_to_response

# /lists
def index(request):
	title = 'All Lists'
	template = loader.get_template('lists/index.html')
	context = Context({
		'title': title,
	})
	return HttpResponse(template.render(context))

# s5 create list view redirect
def new_list(request):
	if not request.user.is_authenticated():
		errors = "To create a new list you have to sign up first."
		context = Context({
			'errors': errors,
		})
		# template = loader.get_template('accounts/siginin.html')
		return render_to_response('accounts/signin.html', context, RequestContext(request))
	else:
		title = 'Create a new list'
		context = Context({
			'title': title,
		})
		return render_to_response('lists/new_list.html', context, RequestContext(request))

def create_list(request):
	return HttpResponse("You!")

# def create_list(request):
# 	# if user is not authenticated
# 	return HttpResponse("FUCK!")
# 	if not request.user.is_authenticated():
# 		# redirect to the sign in page and send error with it
# 		context = Context({ 'errors': "You need to sign in before creating a list"})
# 		return render_to_response('accounts/signin.html', context, RequestContext(context))
# 	# else the user is authenticated
# 	else:
# 		title = request.POST['list_name']
# 		# if the title is empty redirect to create_list page and state error
# 		if not title:
# 			context = Context({ 'list_errors': "You can't enter an empty list name."})
# 			return render_to_response('lists/new_list.html', context, RequestContext(context))

# 		# else if the title is not empty
# 		else:
# 			# check if the user has a list already by that name
# 			if request.user.list_set.filter(title=title):
# 				context = Context({ 'list_errors': "You can't enter an empty list name."})
# 				return render_to_response('lists/new_list.html', context, RequestContext(context))
# 			# else if the user doesn't have a list by that name
# 			else:
# 				return HttpResponse("Wohoo")
# 				# send a dummy response saying that here we will create a list by
# 				# --- by that name


	# list_name = request.POST['list_name']
	# logged_in_user = request.user
	# if request.user.is_authenticated():
	# 	if list_name:
	# 		if logged_in_user.list_set.filter(title=list_name): # Should we limit every list to have a unique name?
	# 			context = Context({
	# 				'list_errors': "You already have a list with the same name."
	# 			})
	# 			return render_to_response('lists/new_list.html', context, RequestContext(request))
	# 	else:
	# 		context = Context({
	# 			'list_errors': "Please enter a list name before you create one."
	# 		})
	# 		return HttpResponse("Phail")
	# 		# return render_to_response('lists/new_list.html', context, RequestContext(request))
	# else:
	# 	context = Context({
	# 		'errors': "Before you create a list you need to sign in."
	# 	})
	# 	return render_to_response('accounts/signin.html', context, RequestContext(request))