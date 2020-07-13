<?php

class Application_Plugin_Acl extends Zend_Controller_Plugin_Abstract
{
	public function routeShutdown(Zend_Controller_Request_Abstract $request)
	{
	    $redirector = Zend_Controller_Action_HelperBroker::getStaticHelper('redirector');
        $flashMessenger = Zend_Controller_Action_HelperBroker::getStaticHelper('FlashMessenger');

		$params = $request->getParams();
		$auth = Zend_Auth::getInstance();
		if($auth->hasIdentity()) {
			$user = Zend_Registry::get('User');

            //Access control
            $acl = array(
                    'add' => array('add', 'copy', 'generate'),
                    'edit' => array('edit', 'lock', 'unlock', 'keepalive', 'apply', 'sort', 'save', 'cancel'),
                    'view' => array('view', 'get', 'index', 'search', 'select', 'preview', 'download'),
                    'delete' => array('delete')
                    );
            if($params['controller'] == 'error') {
                error_log('PERMIT/'.$params['module'].'/'.$params['controller'].'/'.$params['action']);
            } elseif($params['module'] == 'admin') {
                if($user['admin']) {
                    //error_log('PERMIT/'.$params['module'].'/'.$params['controller'].'/'.$params['action']);
                } else {
                    error_log('NO_PERMIT/'.$params['module'].'/'.$params['controller'].'/'.$params['action']);
			        $flashMessenger->addMessage('MESSAGES_ACCESS_DENIED');
			        $redirector->gotoSimple('index', 'index', 'default');
                }
            } else {
	            $permissionsDb = new Application_Model_DbTable_Permission();
	            $permissions = $permissionsDb->getPermissions();
                if(isset($permissions[$params['module']])) {
                    $module = json_decode($permissions[$params['module']], true);
                    if(substr($params['controller'], -3) == 'pos') $params['controller'] = substr($params['controller'], 0, -3);    
                    if($params['module'] == 'contacts') $params['controller'] = 'contact'; 
                    if(strpos($params['action'], 'generate') !== false) $params['action'] = 'generate';
                    if(isset($module[$params['controller']])) {
                        //User can not add if there is no edit permission
                        if(in_array('add', $module[$params['controller']]) && !in_array('edit', $module[$params['controller']])) {
                            $key = array_search('edit', $module[$params['controller']]);
                            unset($module[$params['controller']][$key]);
                        }
                        //Put all permissions together
                        $actions = array();
                        foreach($module[$params['controller']] as $action) {
                            $actions = array_merge($actions, $acl[$action]);
                        }
                        if(in_array($params['action'], $actions)) {
                            //error_log('PERMIT/'.$params['module'].'/'.$params['controller'].'/'.$params['action']);
                        } else {
                            error_log('NO_PERMIT/'.$params['module'].'/'.$params['controller'].'/'.$params['action']);
			                $flashMessenger->addMessage('MESSAGES_ACCESS_DENIED');
                            if(in_array('view', $module[$params['controller']])) $redirector->gotoSimple('index', $params['controller'], $params['module']);
                            else $redirector->gotoSimple('index', 'index', 'index');
                        }
                    } else {
                        error_log('NO_PERMIT/'.$params['module'].'/'.$params['controller'].'/'.$params['action']);
			            $flashMessenger->addMessage('MESSAGES_ACCESS_DENIED');
			            $redirector->gotoSimple('index', 'index', 'default');
                    }
                }
                //error_log($params['module']);
                //error_log($_SERVER['REQUEST_URI']);
			    //$flashMessenger->addMessage('MESSAGES_LOCKED');
            }
		} elseif($params['module'] != 'users' && $params['action'] != 'login') {
			if(isset($params['id']) && $params['id']) {
				$redirector->gotoSimple('login', 'user', 'users', array('url' => $params['module'].'|'.$params['controller'].'|'.$params['action'].'|'.$params['id']));
			} else {
				$redirector->gotoSimple('login', 'user', 'users', array('url' => $params['module'].'|'.$params['controller'].'|'.$params['action']));
			}
		}
	}
}
